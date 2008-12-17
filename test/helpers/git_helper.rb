require File.dirname(__FILE__) + '/in_dir'
require File.dirname(__FILE__) + '/temp_dir_helper'

# Instantiating a GitHelper object creates a temp directory containing 3 repos.
# 1 that's considered the remote repo and 2 peer local repos (local1 and local2).
# All 3 are synchronized with the same data (they contain a few dummy files).
# Once instantiated you can access the 3 full repo locations through attribute readers
# remote, local1 and local2.
class GitHelper < TempDirHelper
  include InDir
  GIT = GitRemoteBranch::GIT
  
  attr_reader :remote, :local1, :local2
  
  def initialize
    super("#{TEST_DIR}/test_runs")
    @remote  = init_repo(directory, 'remote')
    @local1  = clone_repo(@remote, directory, 'local1')
    @local2  = clone_repo(@remote, directory, 'local2')
  end
  
  protected
    def init_repo(path, name)
      repo_dir = File.join(path, name)
      mkdir_p repo_dir
      
      in_dir repo_dir do
        `#{GIT} init && echo "foo" > file.txt && #{GIT} add . && #{GIT} commit -a -m "dummy file"`
      end
      raise "Error setting up repository #{name}" unless $?.exitstatus == 0
      repo_dir
    end
    
    def clone_repo(origin_path, clone_path, name)
      in_dir clone_path do
        `#{GIT} clone #{File.join(origin_path, '.git').path_for_os} #{name}`
      end
      return File.join(clone_path, name)
    end
end
