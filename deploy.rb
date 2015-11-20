file_name = %x(gem build lobbyist.gemspec |  awk '/File/ {print $2}' -)
raise "Build failed!" unless file_name

command = "curl -F package=@#{file_name} https://push.fury.io/P7qkxZzYFkrcJPGnWV43/customerlobby"
exec(command)