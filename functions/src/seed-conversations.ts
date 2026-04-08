/**
 * Easy English Thai
 * Conversation seed importer
 *
 * Writes sample real-life role-play conversations to the `conversations`
 * Firestore collection so the mobile app and Admin CMS have content to work with.
 *
 * Usage:
 *   1. Set GOOGLE_APPLICATION_CREDENTIALS or run inside the Firebase emulator.
 *   2. npm install firebase-admin
 *   3. ts-node seed-conversations.ts
 */

import * as admin from 'firebase-admin';

if (!admin.apps.length) {
  admin.initializeApp();
}

const db = admin.firestore();
const FieldValue = admin.firestore.FieldValue;

interface ConversationTurn {
  id: string;
  turnOrder: number;
  speaker: 'app' | 'learner';
  text: string;
  thaiText: string;
  audioUrl: string | null;
  expectedAnswers: string[] | null;
  hintText: string | null;
}

interface Conversation {
  id: string;
  title: string;
  description: string;
  contextType: string;
  mode: string;
  level: string;
  isPublished: boolean;
  targetPhrases: string[];
  turnCount: number;
  turns: ConversationTurn[];
}

const CONVERSATIONS: Conversation[] = [
  {
    id: 'conv_ordering_food',
    title: 'Ordering Food at a Restaurant',
    description: 'Learn to order a meal, ask about the menu, and pay the bill.',
    contextType: 'restaurant',
    mode: 'guided',
    level: 'beginner',
    isPublished: true,
    targetPhrases: [
      'Can I have the menu, please?',
      'I would like...',
      'How much is it?',
      'The bill, please.',
    ],
    turnCount: 6,
    turns: [
      {
        id: 'turn_01',
        turnOrder: 1,
        speaker: 'app',
        text: 'Welcome! Can I help you?',
        thaiText: 'ยินดีต้อนรับ! ให้ฉันช่วยอะไรได้บ้าง?',
        audioUrl: null,
        expectedAnswers: null,
        hintText: null,
      },
      {
        id: 'turn_02',
        turnOrder: 2,
        speaker: 'learner',
        text: 'Can I have the menu, please?',
        thaiText: 'ขอเมนูหน่อยได้ไหมคะ?',
        audioUrl: null,
        expectedAnswers: [
          'Can I have the menu, please?',
          'May I see the menu?',
          'Can I see the menu please',
        ],
        hintText: 'Ask for the menu politely.',
      },
      {
        id: 'turn_03',
        turnOrder: 3,
        speaker: 'app',
        text: 'Of course! Here is the menu.',
        thaiText: 'แน่นอนค่ะ! นี่คือเมนู',
        audioUrl: null,
        expectedAnswers: null,
        hintText: null,
      },
      {
        id: 'turn_04',
        turnOrder: 4,
        speaker: 'learner',
        text: 'I would like the pad thai, please.',
        thaiText: 'ขอผัดไทยหนึ่งจานค่ะ',
        audioUrl: null,
        expectedAnswers: [
          'I would like the pad thai, please.',
          'I want pad thai please.',
          'Can I have pad thai?',
        ],
        hintText: 'Order using "I would like..."',
      },
      {
        id: 'turn_05',
        turnOrder: 5,
        speaker: 'app',
        text: 'Great choice! That will be 80 baht.',
        thaiText: 'เยี่ยมเลยค่ะ! รวม 80 บาทนะคะ',
        audioUrl: null,
        expectedAnswers: null,
        hintText: null,
      },
      {
        id: 'turn_06',
        turnOrder: 6,
        speaker: 'learner',
        text: 'The bill, please.',
        thaiText: 'เก็บเงินด้วยนะคะ',
        audioUrl: null,
        expectedAnswers: ['The bill, please.', 'Check please.', 'Can I have the bill?'],
        hintText: 'Ask for the bill.',
      },
    ],
  },
  {
    id: 'conv_asking_directions',
    title: 'Asking for Directions',
    description: 'Ask a local how to get to a place and understand the reply.',
    contextType: 'directions',
    mode: 'guided',
    level: 'beginner',
    isPublished: true,
    targetPhrases: [
      'Excuse me, where is...?',
      'Turn left / right.',
      'How far is it?',
      'Thank you very much.',
    ],
    turnCount: 6,
    turns: [
      {
        id: 'turn_01',
        turnOrder: 1,
        speaker: 'learner',
        text: 'Excuse me, where is the train station?',
        thaiText: 'ขอโทษนะคะ สถานีรถไฟอยู่ที่ไหนคะ?',
        audioUrl: null,
        expectedAnswers: [
          'Excuse me, where is the train station?',
          'Where is the train station please?',
        ],
        hintText: 'Start with "Excuse me, where is..."',
      },
      {
        id: 'turn_02',
        turnOrder: 2,
        speaker: 'app',
        text: 'Go straight and then turn left at the traffic light.',
        thaiText: 'เดินตรงไปแล้วเลี้ยวซ้ายที่สัญญาณไฟค่ะ',
        audioUrl: null,
        expectedAnswers: null,
        hintText: null,
      },
      {
        id: 'turn_03',
        turnOrder: 3,
        speaker: 'learner',
        text: 'How far is it?',
        thaiText: 'ไกลแค่ไหนคะ?',
        audioUrl: null,
        expectedAnswers: ['How far is it?', 'Is it far?', 'How far away is it?'],
        hintText: 'Ask about distance.',
      },
      {
        id: 'turn_04',
        turnOrder: 4,
        speaker: 'app',
        text: "It's about 500 metres — a 5-minute walk.",
        thaiText: 'ประมาณ 500 เมตร เดินประมาณ 5 นาทีค่ะ',
        audioUrl: null,
        expectedAnswers: null,
        hintText: null,
      },
      {
        id: 'turn_05',
        turnOrder: 5,
        speaker: 'learner',
        text: 'Thank you very much.',
        thaiText: 'ขอบคุณมากค่ะ',
        audioUrl: null,
        expectedAnswers: [
          'Thank you very much.',
          'Thank you so much.',
          'Thanks a lot.',
        ],
        hintText: 'Express gratitude.',
      },
      {
        id: 'turn_06',
        turnOrder: 6,
        speaker: 'app',
        text: "You're welcome! Have a nice day.",
        thaiText: 'ยินดีค่ะ! ขอให้มีวันที่ดีนะคะ',
        audioUrl: null,
        expectedAnswers: null,
        hintText: null,
      },
    ],
  },
  {
    id: 'conv_shopping',
    title: 'Shopping at a Market',
    description: 'Practise buying goods, asking prices, and bargaining politely.',
    contextType: 'market',
    mode: 'guided',
    level: 'beginner',
    isPublished: false,
    targetPhrases: [
      'How much does this cost?',
      'Do you have a smaller size?',
      'Can you give me a discount?',
      "I'll take it.",
    ],
    turnCount: 6,
    turns: [
      {
        id: 'turn_01',
        turnOrder: 1,
        speaker: 'learner',
        text: 'How much does this cost?',
        thaiText: 'อันนี้ราคาเท่าไหร่คะ?',
        audioUrl: null,
        expectedAnswers: ['How much does this cost?', 'How much is this?', 'What is the price?'],
        hintText: 'Ask the price.',
      },
      {
        id: 'turn_02',
        turnOrder: 2,
        speaker: 'app',
        text: 'It costs 250 baht.',
        thaiText: '250 บาทค่ะ',
        audioUrl: null,
        expectedAnswers: null,
        hintText: null,
      },
      {
        id: 'turn_03',
        turnOrder: 3,
        speaker: 'learner',
        text: 'Can you give me a discount?',
        thaiText: 'ลดราคาได้ไหมคะ?',
        audioUrl: null,
        expectedAnswers: ['Can you give me a discount?', 'Can you lower the price?'],
        hintText: 'Try to negotiate.',
      },
      {
        id: 'turn_04',
        turnOrder: 4,
        speaker: 'app',
        text: 'OK, 220 baht for you.',
        thaiText: 'โอเคค่ะ 220 บาทสำหรับคุณ',
        audioUrl: null,
        expectedAnswers: null,
        hintText: null,
      },
      {
        id: 'turn_05',
        turnOrder: 5,
        speaker: 'learner',
        text: "I'll take it.",
        thaiText: 'เอาเลยค่ะ',
        audioUrl: null,
        expectedAnswers: ["I'll take it.", 'I will take it.', "I'll buy it."],
        hintText: 'Agree to buy.',
      },
      {
        id: 'turn_06',
        turnOrder: 6,
        speaker: 'app',
        text: 'Thank you! Enjoy your purchase.',
        thaiText: 'ขอบคุณค่ะ ขอให้สนุกกับของที่ซื้อนะคะ',
        audioUrl: null,
        expectedAnswers: null,
        hintText: null,
      },
    ],
  },
];

async function seedConversations(): Promise<void> {
  for (const conv of CONVERSATIONS) {
    const { turns, ...convData } = conv;

    await db.doc(`conversations/${conv.id}`).set(
      {
        ...convData,
        createdAt: FieldValue.serverTimestamp(),
        updatedAt: FieldValue.serverTimestamp(),
      },
      { merge: true }
    );

    for (const turn of turns) {
      await db.doc(`conversations/${conv.id}/turns/${turn.id}`).set(
        {
          ...turn,
          createdAt: FieldValue.serverTimestamp(),
        },
        { merge: true }
      );
    }

    console.log(`Seeded conversation: ${conv.id} (${turns.length} turns)`);
  }

  console.log('Conversation seed complete.');
}

seedConversations().catch((err) => {
  console.error(err);
  process.exit(1);
});
