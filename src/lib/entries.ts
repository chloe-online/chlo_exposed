import { writable, derived } from "svelte/store";
import type { DiaryEntry, WeekSelection } from "../types.ts";
import { getWeekNumber, parseDiaryEntries } from "../utils.ts";

// Stores
export const entries = writable<DiaryEntry[]>([]);
export const selectedWeek = writable<WeekSelection>({ week: 1, year: 2025 });
export const isLoading = writable(true);

// Derived store for filtered entries
export const filteredEntries = derived(
  [entries, selectedWeek],
  ([$entries, $selectedWeek]) => {
    if (!$selectedWeek) return $entries;
    return $entries.filter((entry) => {
      const entryWeek = getWeekNumber(entry.date);
      const entryYear = entry.date.getFullYear();
      return (
        entryWeek === $selectedWeek.week && entryYear === $selectedWeek.year
      );
    });
  }
);

// Load entries function
export async function loadEntries() {
  try {
    const diaryText = await fetch("/InjectionDiary.txt").then((r) => r.text());
    const parsedEntries = await parseDiaryEntries(diaryText);

    // Sort entries in descending order (newest first)
    parsedEntries.sort((a, b) => b.date.getTime() - a.date.getTime());

    // Update the entries store
    entries.set(parsedEntries);

    // Set initial selected week
    if (parsedEntries.length > 0) {
      const latestEntry = parsedEntries[0];
      selectedWeek.set({
        week: getWeekNumber(latestEntry.date),
        year: latestEntry.date.getFullYear(),
      });
    }
  } finally {
    isLoading.set(false);
  }
}

// Navigation functions
export function navigateWeek(direction: "next" | "previous") {
  selectedWeek.update(($selectedWeek) => {
    if (!$selectedWeek) return null;

    let { week, year } = $selectedWeek;
    if (direction === "next") {
      week++;
      if (week > 52) {
        week = 1;
        year++;
      }
    } else {
      week--;
      if (week < 1) {
        week = 52;
        year--;
      }
    }
    return { week, year };
  });
}
