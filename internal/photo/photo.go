package photo

import "time"

// Photo represents a single photo
type Photo struct {
	ID          int
	Name        string
	Description string

	TakenAt   time.Time // When photo was actually taken
	CreatedAt time.Time // File creation time
}
