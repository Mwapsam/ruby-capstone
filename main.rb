require_relative './app/app'

def main
  app = App.new
  app.run
  app.console_start
end

main
