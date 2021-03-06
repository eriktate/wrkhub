package wrkhub

import (
	"context"
	"time"

	"github.com/eriktate/wrkhub/uid"
)

// A Task is some unit of work to be done.
type Task struct {
	ID          uid.UID
	Title       string
	Description string
	ProjectID   uid.UID
	ReporterID  uid.UID
	StatusID    uid.UID
	CreatedAt   time.Time
	UpdatedAt   time.Time
}

type Project struct {
	ID          uid.UID   `json:"id" db:"id"`
	Name        string    `json:"name" db:"name"`
	Description string    `json:"description" db:"description"`
	AccountID   uid.UID   `json:"accountId" db:"account_id"`
	CreatedAt   time.Time `json:"createdAt" db:"created_at"`
	UpdatedAt   time.Time `json:"updatedAt" db:"updated_at"`
}

// An Account is the owner of some number of projects.
type Account struct {
	ID        uid.UID   `json:"id" db:"id"`
	Name      string    `json:"name" db:"name"`
	CreatedAt time.Time `json:"createdAt" db:"created_at"`
	UpdatedAt time.Time `json:"updatedAt" db:"updated_at"`
}

// A User is a member of some number of Accounts. User's perform actions in the system.
type User struct {
	ID        uid.UID    `json:"id" db:"id"`
	Name      string     `json:"name" db:"name"`
	Email     string     `json:"email" db:"email"`
	CreatedAt time.Time  `json:"createdAt" db:"created_at"`
	UpdatedAt time.Time  `json:"updatedAt" db:"updated_at"`
	DeletedAt *time.Time `json:"deletedAt,omitempty" db:"deleted_at"`
}

// A ListTasksReq captures a request for some listing of Tasks.
type ListTasksReq struct {
	ProjectID uid.UID
}

// A ListProjectsReq captures a request for some listing of Projects.
type ListProjectsReq struct {
	AccountID uid.UID
}

// A ListAccountsReq captures a request for some listing of Accounts.
type ListAccountsReq struct {
}

// A ListUsersReq captures a request for some listing of Users.
type ListUsersReq struct {
	Accounts []uid.UID `json:"accounts,omitempty" db:"accounts"`
}

// A TaskStore knows how to do basic CRUD operations on a Task.
type TaskStore interface {
	CreateTask(ctx context.Context, task Task) (uid.UID, error)
	UpdateTask(ctx context.Context, task Task) error
	FetchTask(ctx context.Context, id uid.UID) (Task, error)
	ListTasks(ctx context.Context, req ListTasksReq) ([]Task, error)
}

// A ProjectStore knows how to do basic CRUD operations on a Project.
type ProjectStore interface {
	CreateProject(ctx context.Context, project Project) (uid.UID, error)
	UpdateProject(ctx context.Context, project Project) error
	FetchProject(ctx context.Context, id uid.UID) (Project, error)
	ListProjects(ctx context.Context, req ListProjectsReq) ([]Project, error)
}

// An AccountStore knows how to do basic CRUD operations on a Account.
type AccountStore interface {
	CreateAccount(ctx context.Context, account Account) (uid.UID, error)
	UpdateAccount(ctx context.Context, account Account) error
	FetchAccount(ctx context.Context, id uid.UID) (Account, error)
	ListAccounts(ctx context.Context, req ListAccountsReq) ([]Account, error)
}

// An UserStore knows how to do basic CRUD operations on a User.
type UserStore interface {
	CreateUser(ctx context.Context, user User) (uid.UID, error)
	UpdateUser(ctx context.Context, user User) error
	FetchUser(ctx context.Context, id uid.UID) (User, error)
	ListUsers(ctx context.Context, req ListUsersReq) ([]User, error)
}

type AccountService interface {
	SaveAccount(ctx context.Context, account Account) (uid.UID, error)
	ListAccounts(ctx context.Context) ([]Account, error)
	FetchAccount(ctx context.Context, id uid.UID) (Account, error)
}

// A WrkhubService aggregates the functionality of all of the previous stores.
type WrkhubService interface {
	AccountService
}

// The Manager interface captures extraneous actions for now.
type Manager interface {
	AssignAccountUser(ctx context.Context, accountID, userID uid.UID) error
	SetTaskStatus(ctx context.Context, accountID, userID uid.UID) error
}
