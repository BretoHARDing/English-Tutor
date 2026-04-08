'use client';

import { useState } from 'react';

/**
 * Conversation type mirrors the `conversations` Firestore collection.
 * Each document has turns (app / learner alternating), a context tag,
 * a difficulty level, and a list of target phrases.
 */
interface ConversationTurn {
  turnOrder: number;
  speaker: 'app' | 'learner';
  text: string;
  thaiText: string;
  hintText?: string;
  expectedAnswers?: string[];
}

interface Conversation {
  id: string;
  title: string;
  description: string;
  contextType:
    | 'restaurant'
    | 'directions'
    | 'shopping'
    | 'airport'
    | 'hotel'
    | 'clinic'
    | 'school'
    | 'market'
    | 'general';
  level: 'beginner' | 'intermediate' | 'advanced';
  targetPhrases: string[];
  isPublished: boolean;
  turnCount: number;
  turns?: ConversationTurn[];
}

// ── Static seed conversations shown while real data loads ─────────────────

const SAMPLE_CONVERSATIONS: Conversation[] = [
  {
    id: 'conv_ordering_food',
    title: 'Ordering Food at a Restaurant',
    description: 'Learn to order a meal, ask about the menu, and pay the bill.',
    contextType: 'restaurant',
    level: 'beginner',
    targetPhrases: [
      'Can I have the menu, please?',
      'I would like...',
      'How much is it?',
      'The bill, please.',
    ],
    isPublished: true,
    turnCount: 8,
  },
  {
    id: 'conv_asking_directions',
    title: 'Asking for Directions',
    description: 'Ask a local how to get to a place and understand the reply.',
    contextType: 'directions',
    level: 'beginner',
    targetPhrases: [
      'Excuse me, where is...?',
      'Turn left / right.',
      'How far is it?',
      'Thank you very much.',
    ],
    isPublished: true,
    turnCount: 6,
  },
  {
    id: 'conv_shopping',
    title: 'Shopping at a Market',
    description: 'Practise buying goods, asking prices, and bargaining politely.',
    contextType: 'market',
    level: 'beginner',
    targetPhrases: [
      'How much does this cost?',
      'Do you have a smaller size?',
      'Can you give me a discount?',
      "I'll take it.",
    ],
    isPublished: false,
    turnCount: 10,
  },
  {
    id: 'conv_airport_checkin',
    title: 'Airport Check-in',
    description: 'Handle check-in, baggage questions, and gate enquiries.',
    contextType: 'airport',
    level: 'intermediate',
    targetPhrases: [
      'I have a flight to...',
      'Window seat, please.',
      'Where is gate...?',
      'Is the flight on time?',
    ],
    isPublished: true,
    turnCount: 7,
  },
  {
    id: 'conv_hotel_checkin',
    title: 'Checking into a Hotel',
    description: 'Practice hotel check-in, room requests, and breakfast queries.',
    contextType: 'hotel',
    level: 'intermediate',
    targetPhrases: [
      'I have a reservation.',
      'Could I have a wake-up call?',
      'What time is breakfast?',
      'Is Wi-Fi included?',
    ],
    isPublished: false,
    turnCount: 9,
  },
];

const CONTEXT_LABELS: Record<Conversation['contextType'], string> = {
  restaurant: '🍽 Restaurant',
  directions: '🗺 Directions',
  shopping: '🛍 Shopping',
  airport: '✈️ Airport',
  hotel: '🏨 Hotel',
  clinic: '🏥 Clinic',
  school: '🏫 School',
  market: '🛒 Market',
  general: '💬 General',
};

const LEVEL_COLORS: Record<Conversation['level'], string> = {
  beginner: '#34A853',
  intermediate: '#FBBC04',
  advanced: '#EA4335',
};

// ── Page ──────────────────────────────────────────────────────────────────

/**
 * ConversationPage — Admin CMS
 *
 * Lists all real-life role-play conversations stored in the `conversations`
 * Firestore collection.  Admins can filter by context type and publish state,
 * view turn previews, and open an editor to add or modify conversations.
 *
 * Firestore path: conversations/{conversationId}
 * Sub-collection:  conversations/{conversationId}/turns/{turnId}
 */
export default function ConversationPage() {
  const [filterContext, setFilterContext] = useState<string>('all');
  const [filterPublished, setFilterPublished] = useState<string>('all');
  const [searchQuery, setSearchQuery] = useState('');
  const [expandedId, setExpandedId] = useState<string | null>(null);

  const filtered = SAMPLE_CONVERSATIONS.filter((c) => {
    if (filterContext !== 'all' && c.contextType !== filterContext) return false;
    if (filterPublished === 'published' && !c.isPublished) return false;
    if (filterPublished === 'draft' && c.isPublished) return false;
    if (
      searchQuery &&
      !c.title.toLowerCase().includes(searchQuery.toLowerCase()) &&
      !c.description.toLowerCase().includes(searchQuery.toLowerCase())
    )
      return false;
    return true;
  });

  return (
    <div style={{ maxWidth: 900, margin: '0 auto', padding: '2rem 1.5rem' }}>
      {/* ── Header ── */}
      <div
        style={{
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'flex-start',
          marginBottom: '1.5rem',
          flexWrap: 'wrap',
          gap: 12,
        }}
      >
        <div>
          <h1 style={{ fontSize: '1.75rem', fontWeight: 700, margin: 0 }}>
            Conversations
          </h1>
          <p style={{ color: '#5F6368', marginTop: 4 }}>
            Real-life role-play dialogues (ordering food, asking directions, etc.)
          </p>
        </div>
        <button style={primaryButtonStyle}>+ New Conversation</button>
      </div>

      {/* ── Filters ── */}
      <div
        style={{
          display: 'flex',
          gap: 12,
          flexWrap: 'wrap',
          marginBottom: '1.5rem',
        }}
      >
        <input
          type="search"
          placeholder="Search conversations…"
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          style={inputStyle}
        />

        <select
          value={filterContext}
          onChange={(e) => setFilterContext(e.target.value)}
          style={selectStyle}
        >
          <option value="all">All contexts</option>
          {Object.entries(CONTEXT_LABELS).map(([k, v]) => (
            <option key={k} value={k}>
              {v}
            </option>
          ))}
        </select>

        <select
          value={filterPublished}
          onChange={(e) => setFilterPublished(e.target.value)}
          style={selectStyle}
        >
          <option value="all">All states</option>
          <option value="published">Published</option>
          <option value="draft">Draft</option>
        </select>
      </div>

      {/* ── Stats bar ── */}
      <div
        style={{
          display: 'flex',
          gap: 16,
          marginBottom: '1.5rem',
          fontSize: '0.875rem',
          color: '#5F6368',
        }}
      >
        <span>
          <strong style={{ color: '#202124' }}>
            {SAMPLE_CONVERSATIONS.filter((c) => c.isPublished).length}
          </strong>{' '}
          published
        </span>
        <span>
          <strong style={{ color: '#202124' }}>
            {SAMPLE_CONVERSATIONS.filter((c) => !c.isPublished).length}
          </strong>{' '}
          draft
        </span>
        <span>
          <strong style={{ color: '#202124' }}>{filtered.length}</strong>{' '}
          shown
        </span>
      </div>

      {/* ── Conversation cards ── */}
      {filtered.length === 0 ? (
        <div
          style={{
            textAlign: 'center',
            padding: '3rem',
            color: '#5F6368',
            background: '#F8F9FA',
            borderRadius: 12,
          }}
        >
          No conversations match the current filters.
        </div>
      ) : (
        <div style={{ display: 'flex', flexDirection: 'column', gap: 12 }}>
          {filtered.map((conv) => (
            <ConversationCard
              key={conv.id}
              conversation={conv}
              isExpanded={expandedId === conv.id}
              onToggleExpand={() =>
                setExpandedId(expandedId === conv.id ? null : conv.id)
              }
            />
          ))}
        </div>
      )}

      {/* ── Firestore info box ── */}
      <div
        style={{
          marginTop: '2rem',
          background: '#E8F0FE',
          border: '1px solid #C5D8FB',
          borderRadius: 12,
          padding: '1.25rem',
          fontSize: '0.875rem',
          color: '#174EA6',
        }}
      >
        <strong>Firestore collection path:</strong>{' '}
        <code>conversations/&#123;conversationId&#125;</code>
        <br />
        <strong>Sub-collection:</strong>{' '}
        <code>
          conversations/&#123;conversationId&#125;/turns/&#123;turnId&#125;
        </code>
        <br />
        <br />
        Each turn has: <code>turnOrder</code>, <code>speaker</code> (app |
        learner), <code>text</code>, <code>thaiText</code>,{' '}
        <code>expectedAnswers</code>, <code>hintText</code>.
      </div>
    </div>
  );
}

// ── ConversationCard ──────────────────────────────────────────────────────

interface ConversationCardProps {
  conversation: Conversation;
  isExpanded: boolean;
  onToggleExpand: () => void;
}

function ConversationCard({
  conversation: conv,
  isExpanded,
  onToggleExpand,
}: ConversationCardProps) {
  return (
    <div
      style={{
        background: '#fff',
        border: '1px solid #DADCE0',
        borderRadius: 12,
        overflow: 'hidden',
      }}
    >
      {/* Card header */}
      <div style={{ padding: '1rem 1.25rem' }}>
        <div
          style={{
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'flex-start',
            gap: 12,
          }}
        >
          <div style={{ flex: 1 }}>
            <div
              style={{
                display: 'flex',
                alignItems: 'center',
                gap: 8,
                marginBottom: 6,
              }}
            >
              <span
                style={{
                  background: LEVEL_COLORS[conv.level] + '22',
                  color: LEVEL_COLORS[conv.level],
                  border: `1px solid ${LEVEL_COLORS[conv.level]}44`,
                  borderRadius: 20,
                  padding: '2px 10px',
                  fontSize: '0.75rem',
                  fontWeight: 600,
                  textTransform: 'capitalize',
                }}
              >
                {conv.level}
              </span>
              <span
                style={{
                  background: '#F8F9FA',
                  color: '#5F6368',
                  borderRadius: 20,
                  padding: '2px 10px',
                  fontSize: '0.75rem',
                  fontWeight: 500,
                }}
              >
                {CONTEXT_LABELS[conv.contextType]}
              </span>
              <span
                style={{
                  background: conv.isPublished ? '#E6F4EA' : '#FEF7E0',
                  color: conv.isPublished ? '#137333' : '#B06000',
                  borderRadius: 20,
                  padding: '2px 10px',
                  fontSize: '0.75rem',
                  fontWeight: 600,
                }}
              >
                {conv.isPublished ? 'Published' : 'Draft'}
              </span>
            </div>

            <h3 style={{ margin: 0, fontSize: '1rem', fontWeight: 600 }}>
              {conv.title}
            </h3>
            <p
              style={{
                margin: '4px 0 0',
                fontSize: '0.875rem',
                color: '#5F6368',
              }}
            >
              {conv.description}
            </p>
          </div>

          <div style={{ display: 'flex', gap: 8, flexShrink: 0 }}>
            <button
              onClick={onToggleExpand}
              style={outlineButtonStyle}
            >
              {isExpanded ? 'Hide turns' : `${conv.turnCount} turns`}
            </button>
            <button style={primaryButtonStyle}>Edit</button>
          </div>
        </div>

        {/* Target phrases */}
        <div style={{ marginTop: 12, display: 'flex', gap: 6, flexWrap: 'wrap' }}>
          {conv.targetPhrases.map((phrase) => (
            <span
              key={phrase}
              style={{
                background: '#F0F4FF',
                color: '#1A73E8',
                borderRadius: 6,
                padding: '3px 10px',
                fontSize: '0.8125rem',
              }}
            >
              &ldquo;{phrase}&rdquo;
            </span>
          ))}
        </div>
      </div>

      {/* Expanded turns preview */}
      {isExpanded && (
        <div
          style={{
            borderTop: '1px solid #DADCE0',
            padding: '1rem 1.25rem',
            background: '#FAFAFA',
          }}
        >
          <p style={{ fontSize: '0.8125rem', color: '#5F6368', marginBottom: 12 }}>
            Turns are stored in{' '}
            <code>conversations/{conv.id}/turns/</code>. Connect to Firestore
            to load them here.
          </p>

          {/* Sample turn skeleton */}
          {[1, 2, 3].map((n) => (
            <div
              key={n}
              style={{
                display: 'flex',
                gap: 12,
                marginBottom: 8,
                alignItems: 'flex-start',
              }}
            >
              <span
                style={{
                  background: n % 2 === 0 ? '#E8F0FE' : '#E6F4EA',
                  color: n % 2 === 0 ? '#1A73E8' : '#137333',
                  borderRadius: 6,
                  padding: '2px 8px',
                  fontSize: '0.75rem',
                  fontWeight: 600,
                  flexShrink: 0,
                }}
              >
                {n % 2 === 0 ? 'Learner' : 'App'}
              </span>
              <div
                style={{
                  height: 14,
                  background: '#E8EAED',
                  borderRadius: 4,
                  flex: 1,
                }}
              />
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

// ── Style helpers ──────────────────────────────────────────────────────────

const primaryButtonStyle: React.CSSProperties = {
  padding: '8px 18px',
  borderRadius: 8,
  border: 'none',
  background: '#1A73E8',
  color: '#fff',
  fontWeight: 600,
  fontSize: '0.875rem',
  cursor: 'pointer',
};

const outlineButtonStyle: React.CSSProperties = {
  padding: '7px 14px',
  borderRadius: 8,
  border: '1px solid #DADCE0',
  background: '#fff',
  color: '#5F6368',
  fontWeight: 500,
  fontSize: '0.875rem',
  cursor: 'pointer',
};

const inputStyle: React.CSSProperties = {
  padding: '8px 14px',
  borderRadius: 8,
  border: '1px solid #DADCE0',
  fontSize: '0.875rem',
  flex: '1 1 200px',
  outline: 'none',
};

const selectStyle: React.CSSProperties = {
  padding: '8px 12px',
  borderRadius: 8,
  border: '1px solid #DADCE0',
  fontSize: '0.875rem',
  background: '#fff',
  cursor: 'pointer',
};
