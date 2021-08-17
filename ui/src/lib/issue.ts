import type { Dayjs } from "dayjs";

export interface State {
  id: string;
  name: string;
}

export interface Issue {
  id: string;
  title: string;
  state: State;
  description: string;
  createdAt: Dayjs;
  updatedAt: Dayjs;
}

export function issuesByState(issues: Issue[], stateId: string) {
  return issues.filter((issue) => issue.state.id === stateId);
}
