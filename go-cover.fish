function go-cover
	go test -coverprofile=cover.out $argv; 
	and go tool cover -html=cover.out -o ./.cover.html;
    and rm cover.out;
    and open ./.cover.html; 
    and sleep 1; 
    and rm ./.cover.html
end

