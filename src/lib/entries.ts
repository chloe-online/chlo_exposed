import { writable, derived, get } from "svelte/store";
import type { DiaryEntry, WeekSelection } from "../types.ts";
import { getWeekNumber, parseDiaryEntries } from "./utils.ts";

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
    let { week, year } = $selectedWeek;

    // Get the current entries value using get
    const $entries = get(entries);

    // Determine the first and last weeks in the entries
    const firstEntry = $entries[$entries.length - 1];
    const lastEntry = $entries[0];
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
          return { week: lastWeek, year: lastYear };
        }
      } while (
        !$entries.some((entry) => {
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
          return { week: firstWeek, year: firstYear };
        }
      } while (
        !$entries.some((entry) => {
          const entryWeek = getWeekNumber(entry.date);
          const entryYear = entry.date.getFullYear();
          return entryWeek === week && entryYear === year;
        })
      );
    }
    return { week, year };
  });
}
