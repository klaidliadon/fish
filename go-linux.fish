function go-linux
	set -x GOOS linux; 
	and set -x GOARCH amd64; 
	and go build $argv
end

