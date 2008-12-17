module GitRemoteBranch  
  module VERSION #:nodoc:
    MAJOR    = 0
    MINOR    = 3
    TINY     = 0
    
    STRING   = [MAJOR, MINOR, TINY].join('.').freeze
  end
  
  NAME          = 'git_remote_branch'.freeze
  COMPLETE_NAME = "#{NAME} #{VERSION::STRING}".freeze  
  COMMAND_NAME  = 'grb'.freeze
  SHORT_NAME    = COMMAND_NAME
end
