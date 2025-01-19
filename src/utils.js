export function getWeekNumber(date) {
  const firstDayOfYear = new Date(date.getFullYear(), 0, 1);
  const pastDaysOfYear = (date - firstDayOfYear) / 86400000;
  return Math.ceil((pastDaysOfYear + firstDayOfYear.getDay() + 1) / 7);
}

export async function parseDiaryEntries(text) {
  const withoutHeader = text.split("\n").slice(2).join("\n");
  const rawEntries = withoutHeader.split("<div><br></div>\n");

  const entries = rawEntries
    .filter((entry) => entry.trim())
    .map((entry) => {
      const lines = entry.split("\n");

      // Parse date in format "MM/DD/YY"
      const dateStr = lines[0].replace("<div>", "").replace("</div>", "");
      const [month, day, yearStr] = dateStr.split("/");

      // Ensure year is properly formatted
      const fullYear = yearStr.length === 2 ? "20" + yearStr : yearStr;

      // Create date object (months are 0-based in JavaScript)
      const date = new Date(
        parseInt(fullYear),
        parseInt(month) - 1,
        parseInt(day)
      );

      const site = lines[1].replace("<div>", "").replace("</div>", "");
      const comment = lines
        .slice(2)
        .map((line) => line.replace("<div>", "").replace("</div>", ""))
        .join(" ")
        .trim();
      return { date, site, comment };
    });

  return entries;
}
