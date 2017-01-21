require 'mina/bundler'

namespace :lock do
  desc 'Lock deployment'
  task deployment: :environment do
    queue %[echo '-----> Locking deployment (manually)']
    queue! "touch #{deploy_to}/#{current_path}/deployment.lock"
  end
end

namespace :unlock do
  desc 'Unlock deployment'
  task deployment: :environment do
    queue %[echo '-----> Unlock deployment (manually)']
    queue! "rm -f #{deploy_to}/#{current_path}/deployment.lock"
  end
end

namespace :fail do
  desc 'Check if the deployment is permitted'
  task when_locked: :environment do
    queue %[echo '-----> Check that the deployment is not manually locked']
    queue! %[
      FILE=#{deploy_to}/#{current_path}/deployment.lock
      if [ -f "$FILE" ];
      then
         echo "The deployment of this project is currently locked. File $FILE exist."
         exit 17
      fi
    ]
  end
end
