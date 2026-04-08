import Link from "next/link";

const SAMPLE_LESSONS = [
  { id: "lesson_greetings", title: "Greetings & Introductions", level: "beginner", steps: 5 },
  { id: "lesson_numbers", title: "Numbers & Counting", level: "beginner", steps: 6 },
  { id: "lesson_food", title: "Food & Ordering", level: "beginner", steps: 7 },
  { id: "lesson_directions", title: "Asking for Directions", level: "intermediate", steps: 5 },
];

const levelColor: Record<string, string> = {
  beginner: "bg-green-100 text-green-700",
  intermediate: "bg-yellow-100 text-yellow-700",
  advanced: "bg-red-100 text-red-700",
};

export default function LessonsPage() {
  return (
    <div className="min-h-screen bg-zinc-50 font-sans">
      {/* Header */}
      <header className="bg-white border-b border-zinc-200 px-8 py-5">
        <div className="max-w-5xl mx-auto flex items-center gap-4">
          <Link href="/" className="text-zinc-400 hover:text-zinc-700 text-sm">
            ← หน้าหลัก
          </Link>
          <span className="text-zinc-300">|</span>
          <h1 className="text-lg font-bold text-zinc-900">📚 บทเรียนทั้งหมด</h1>
        </div>
      </header>

      <main className="max-w-5xl mx-auto px-8 py-10">
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-xl font-semibold text-zinc-800">
            บทเรียน ({SAMPLE_LESSONS.length})
          </h2>
          <button className="bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold px-4 py-2 rounded-lg transition">
            + สร้างบทเรียน
          </button>
        </div>

        <div className="space-y-3">
          {SAMPLE_LESSONS.map((lesson) => (
            <Link
              key={lesson.id}
              href={`/lessons/${lesson.id}`}
              className="flex items-center justify-between bg-white border border-zinc-200 hover:border-blue-300 rounded-xl px-6 py-4 transition group"
            >
              <div className="flex items-center gap-4">
                <span className="text-2xl">📖</span>
                <div>
                  <p className="font-semibold text-zinc-900 group-hover:text-blue-700">
                    {lesson.title}
                  </p>
                  <p className="text-sm text-zinc-500">{lesson.steps} ขั้นตอน</p>
                </div>
              </div>
              <div className="flex items-center gap-3">
                <span
                  className={`text-xs font-semibold px-3 py-1 rounded-full ${levelColor[lesson.level] ?? "bg-zinc-100 text-zinc-600"}`}
                >
                  {lesson.level}
                </span>
                <span className="text-zinc-400 group-hover:text-blue-500">→</span>
              </div>
            </Link>
          ))}
        </div>
      </main>
    </div>
  );
}
