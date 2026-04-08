import Link from "next/link";

export default function Home() {
  const cards = [
    {
      href: "/conversations",
      icon: "💬",
      title: "บทสนทนา",
      subtitle: "Conversations",
      description: "สร้างและแก้ไขบทสนทนาสำหรับการฝึกพูด",
      color: "bg-blue-50 border-blue-200 hover:border-blue-400",
      iconBg: "bg-blue-100",
    },
    {
      href: "/lessons",
      icon: "📚",
      title: "บทเรียน",
      subtitle: "Lessons",
      description: "จัดการบทเรียนและขั้นตอนการเรียน",
      color: "bg-green-50 border-green-200 hover:border-green-400",
      iconBg: "bg-green-100",
    },
  ];

  return (
    <div className="min-h-screen bg-zinc-50 font-sans">
      {/* Header */}
      <header className="bg-white border-b border-zinc-200 px-8 py-5">
        <div className="max-w-5xl mx-auto flex items-center gap-3">
          <span className="text-2xl">🇹🇭</span>
          <div>
            <h1 className="text-xl font-bold text-zinc-900 leading-tight">
              Easy English Thai — Admin CMS
            </h1>
            <p className="text-sm text-zinc-500">จัดการเนื้อหาบทเรียนภาษาอังกฤษ</p>
          </div>
        </div>
      </header>

      {/* Main */}
      <main className="max-w-5xl mx-auto px-8 py-12">
        <h2 className="text-2xl font-semibold text-zinc-800 mb-2">
          ยินดีต้อนรับ 👋
        </h2>
        <p className="text-zinc-500 mb-10">
          เลือกหัวข้อด้านล่างเพื่อเริ่มจัดการเนื้อหา
        </p>

        <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
          {cards.map((card) => (
            <Link
              key={card.href}
              href={card.href}
              className={`group block rounded-2xl border-2 p-7 transition-all duration-150 ${card.color}`}
            >
              <div
                className={`inline-flex items-center justify-center w-12 h-12 rounded-xl text-2xl mb-4 ${card.iconBg}`}
              >
                {card.icon}
              </div>
              <h3 className="text-lg font-bold text-zinc-900 leading-tight">
                {card.title}
              </h3>
              <p className="text-sm text-zinc-500 font-medium mb-1">
                {card.subtitle}
              </p>
              <p className="text-sm text-zinc-600 mt-2">{card.description}</p>
              <span className="mt-4 inline-flex items-center gap-1 text-sm font-semibold text-zinc-700 group-hover:gap-2 transition-all">
                เปิดดู →
              </span>
            </Link>
          ))}
        </div>

        {/* Quick stats strip */}
        <div className="mt-12 grid grid-cols-3 gap-4 text-center">
          {[
            { label: "บทสนทนา", value: "5" },
            { label: "บทเรียน", value: "—" },
            { label: "ผู้เรียน", value: "—" },
          ].map((s) => (
            <div
              key={s.label}
              className="bg-white rounded-xl border border-zinc-200 py-5"
            >
              <p className="text-3xl font-bold text-zinc-900">{s.value}</p>
              <p className="text-sm text-zinc-500 mt-1">{s.label}</p>
            </div>
          ))}
        </div>
      </main>
    </div>
  );
}

