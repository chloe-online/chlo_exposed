import { writable } from "svelte/store";

export const openCalendarId = writable(null);
export const selectedWeek = writable(null);
export const showAbout = writable(false);
