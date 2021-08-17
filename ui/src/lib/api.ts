import dayjs from "dayjs";

import type { State, Issue } from "./issue";

const STATE_OPEN: State = { id: "1", name: "open" };
const STATE_IN_PROGRESS: State = { id: "2", name: "in progress" };
const STATE_CLOSED: State = { id: "3", name: "closed" };

// random latency up to 500ms
function getRandomLatency() {
  return 500 * Math.random();
}

export async function getStates(): Promise<State[]> {
  return new Promise((resolve, reject) => {
    const states = [
      {
        id: "1",
        name: "open",
      },
      {
        id: "2",
        name: "in progress",
      },
      {
        id: "3",
        name: "done",
      },
    ];
    setTimeout(() => resolve(states), getRandomLatency());
  });
}

export async function getIssues(): Promise<Issue[]> {
  return new Promise((resolve, reject) => {
    const issues: Issue[] = [
      {
        id: "3",
        title: "Task One",
        description: "Woo?",
        state: STATE_OPEN,
        createdAt: dayjs().subtract(10, "minutes"),
        updatedAt: dayjs().subtract(10, "minutes"),
      },
      {
        id: "2",
        title: "Task Two",
        description: "Woo2?",
        state: STATE_IN_PROGRESS,
        createdAt: dayjs(),
        updatedAt: dayjs(),
      },
      {
        id: "1",
        title: "Task Three",
        description: "Woo3?",
        state: STATE_CLOSED,
        createdAt: dayjs(),
        updatedAt: dayjs(),
      },
    ];

    setTimeout(() => resolve(issues), getRandomLatency());
  });
}
