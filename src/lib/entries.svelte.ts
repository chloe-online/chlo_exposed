import { getWeekNumber, parseDiaryEntries } from "./utils.ts";
import type { DiaryEntry, WeekSelection } from "../types.ts";

// Create a store object to hold all state
export const store = $state({
  entries: [] as DiaryEntry[],
  selectedWeek: { week: 1, year: 2025 } as WeekSelection,
  isLoading: true,
});

// Update all functions to use store
export function setSelectedWeek(week: WeekSelection) {
  store.selectedWeek = week;
}

// Update loadEntries to use store
export async function loadEntries() {
  try {
    const diaryText = await fetch("/InjectionDiary.txt").then((r) => r.text());
    const parsedEntries = await parseDiaryEntries(diaryText);
    parsedEntries.sort((a, b) => b.date.getTime() - a.date.getTime());

    store.entries = parsedEntries;

    if (parsedEntries.length > 0) {
      const latestEntry = parsedEntries[0];
      store.selectedWeek = {
        week: getWeekNumber(latestEntry.date),
        year: latestEntry.date.getFullYear(),
      };
    }
  } finally {
    store.isLoading = false;
  }
}

// Navigation functions
export function navigateWeek(direction: "next" | "previous") {
  let { week, year } = store.selectedWeek;

  // Determine the first and last weeks in the entries
  const firstEntry = store.entries[store.entries.length - 1];
  const lastEntry = store.entries[0];
  const firstWeek = getWeekNumber(firstEntry.date);
  const firstYear = firstEntry.date.getFullYear();
  const lastWeek = getWeekNumber(lastEntry.date);
  const lastYear = lastEntry.date.getFullYear();

  if (direction === "next") {
    do {
      week += 1;
      if (week > 52) {
        week = 1;
        year += 1;
      }
      // Stop if we're at the last available week
      if (year > lastYear || (year === lastYear && week > lastWeek)) {
        store.selectedWeek = { week: lastWeek, year: lastYear };
        return;
      }
    } while (
      !store.entries.some((entry) => {
        const entryWeek = getWeekNumber(entry.date);
        const entryYear = entry.date.getFullYear();
        return entryWeek === week && entryYear === year;
      })
    );
  } else if (direction === "previous") {
    do {
      week -= 1;
      if (week < 1) {
        week = 52;
        year -= 1;
      }
      // Stop if we're at the first available week
      if (year < firstYear || (year === firstYear && week < firstWeek)) {
        store.selectedWeek = { week: firstWeek, year: firstYear };
        return;
      }
    } while (
      !store.entries.some((entry) => {
        const entryWeek = getWeekNumber(entry.date);
        const entryYear = entry.date.getFullYear();
        return entryWeek === week && entryYear === year;
      })
    );
  }
  store.selectedWeek = { week, year };
}
