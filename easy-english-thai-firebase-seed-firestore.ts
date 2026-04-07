/**
 * Easy English Thai
 * Firebase Admin SDK seed importer
 *
 * Usage:
 *   1. Place service account credentials in GOOGLE_APPLICATION_CREDENTIALS or run in Firebase emulator/admin environment
 *   2. npm install firebase-admin
 *   3. ts-node seed-firestore.ts ./easy-english-thai-firestore-seed.json
 *
 * Notes:
 *   - This script writes top-level collections and configured subcollections.
 *   - It sets server timestamps for fields ending in At when missing.
 */

import * as fs from 'fs';
import * as path from 'path';
import * as admin from 'firebase-admin';

type JsonMap = Record<string, any>;

const inputPath = process.argv[2] || './easy-english-thai-firestore-seed.json';

if (!admin.apps.length) {
  admin.initializeApp();
}

const db = admin.firestore();
const FieldValue = admin.firestore.FieldValue;

function withTimestamps(data: JsonMap): JsonMap {
  const copy: JsonMap = { ...data };
  for (const [key, value] of Object.entries(copy)) {
    if (value && typeof value === 'object' && !Array.isArray(value)) {
      copy[key] = withTimestamps(value);
    } else if (Array.isArray(value)) {
      copy[key] = value.map((item) =>
        item && typeof item === 'object' && !Array.isArray(item) ? withTimestamps(item) : item
      );
    }
  }

  const nowFields = ['createdAt', 'updatedAt'];
  for (const field of nowFields) {
    if (!(field in copy)) {
      copy[field] = FieldValue.serverTimestamp();
    }
  }
  return copy;
}

async function writeDocument(docPath: string, data: JsonMap): Promise<void> {
  const prepared = withTimestamps(data);
  await db.doc(docPath).set(prepared, { merge: true });
  console.log(`Wrote ${docPath}`);
}

async function importTopLevelCollections(seed: JsonMap): Promise<void> {
  const collections = seed.collections || {};
  for (const [collectionName, docs] of Object.entries<JsonMap>(collections)) {
    for (const [docId, docData] of Object.entries<JsonMap>(docs)) {
      await writeDocument(`${collectionName}/${docId}`, docData);
    }
  }
}

async function importSubcollections(seed: JsonMap): Promise<void> {
  const subcollections = seed.subcollections || {};

  // lessons/{lessonId}/steps/{stepId}
  const lessonSub = subcollections.lessons || {};
  for (const [lessonId, content] of Object.entries<JsonMap>(lessonSub)) {
    const steps = content.steps || {};
    for (const [stepId, stepData] of Object.entries<JsonMap>(steps)) {
      await writeDocument(`lessons/${lessonId}/steps/${stepId}`, stepData);
    }
  }

  // dialogues/{dialogueId}/turns/{turnId}
  const dialogueSub = subcollections.dialogues || {};
  for (const [dialogueId, content] of Object.entries<JsonMap>(dialogueSub)) {
    const turns = content.turns || {};
    for (const [turnId, turnData] of Object.entries<JsonMap>(turns)) {
      await writeDocument(`dialogues/${dialogueId}/turns/${turnId}`, turnData);
    }
  }
}

async function main(): Promise<void> {
  const resolved = path.resolve(inputPath);
  if (!fs.existsSync(resolved)) {
    throw new Error(`Seed file not found: ${resolved}`);
  }

  const raw = fs.readFileSync(resolved, 'utf-8');
  const seed = JSON.parse(raw);

  console.log(`Importing seed from ${resolved}`);
  await importTopLevelCollections(seed);
  await importSubcollections(seed);

  console.log('Seed import complete.');
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
