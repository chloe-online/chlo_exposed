import fs from "fs";
import { execSync } from "child_process";

const getLastCommitDate = () => {
  try {
    const date = execSync("git log -1 --format=%cd").toString().trim();
    return new Date(date).toLocaleString("en-US", {
      year: "numeric",
      month: "2-digit",
      day: "2-digit",
      hour: "2-digit",
      minute: "2-digit",
      timeZoneName: "short",
    });
  } catch (error) {
    console.error("Error getting git commit date:", error);
    return new Date().toLocaleString("en-US", {
      year: "numeric",
      month: "2-digit",
      day: "2-digit",
      hour: "2-digit",
      minute: "2-digit",
      timeZoneName: "short",
    });
  }
};

const meta = {
  lastUpdated: getLastCommitDate(),
};

// Write to a JSON file that will be included in the build
fs.writeFileSync("./src/lib/meta.json", JSON.stringify(meta, null, 2));
