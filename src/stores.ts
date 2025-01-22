import { writable } from "svelte/store";

export const openCalendarId = writable(null);
export const selectedWeek = writable({ year: 0, week: 0 });
export const showAbout = writable(false);
export const isCalendarVisible = writable(false);
