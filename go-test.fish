function go-test
  mongod > /dev/null&
  beanstalkd > /dev/null&
  go test $argv
  killall mongod
  killall beanstalkd
end