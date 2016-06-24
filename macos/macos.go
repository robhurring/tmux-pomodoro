package macos

import (
	"os/exec"
	"strings"
)

const soundsDir = "/System/Library/Sounds/"

func play(name string) error {
	return exec.Command("afplay", name).Start()
}

func titleize(s string) string {
	return strings.ToUpper(s[:1]) + strings.ToLower(s[1:])
}

// PlaySound plays a system sound
func PlaySound(name string) error {
	return play(soundsDir + titleize(name))
}
