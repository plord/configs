function repo
    curl -u 'plord' https://api.github.com/user/repos -d "{\"name\":\"$argv\"}"
end
