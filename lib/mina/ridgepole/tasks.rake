require 'mina/bundler'
require 'mina/rails'

namespace :ridgepole do
  set_default :ridgepole_env,       -> { fetch(:rails_env, 'production') }
  set_default :ridgepole_config,    -> { "#{deploy_to}/#{shared_path}/config/database.yml" }
  set_default :ridgepole_schemafile,-> { "Schemafile" }
  set_default :ridgepole_options,   -> { "" }
  set_default :ridgepole_cmd,       -> { "#{bundle_prefix} ridgepole" }

  desc 'apply ridgepole'
  task :apply => :environment do
    options ||= ridgepole_options.kind_of?(Array) ? ridgepole_options.join(' ') : ridgepole_options.to_s
    queue! %[
      echo "-----> Applying schema."
      if [ -f '#{deploy_to}/#{lock_file}' ]; then
        #{ridgepole_cmd} -E #{ridgepole_env} --config #{ridgepole_config} --file #{ridgepole_schemafile} --apply #{options}
      else
        cd #{deploy_to}/#{current_path} && #{ridgepole_cmd} -E #{ridgepole_env} --config #{ridgepole_config} --file #{ridgepole_schemafile} --apply #{options}
      fi
    ]
  end

  desc 'apply dry-run ridgepole'
  task :apply_dryrun => :environment do
    options ||= ridgepole_options.kind_of?(Array) ? ridgepole_options.join(' ') : ridgepole_options.to_s
    queue! %[
      echo "-----> Applying schema.(dry-run)"
      if [ -f '#{deploy_to}/#{lock_file}' ]; then
        #{ridgepole_cmd} -E #{ridgepole_env} --config #{ridgepole_config} --file #{ridgepole_schemafile} --apply --dry-run #{options}
      else
        cd #{deploy_to}/#{current_path} && #{ridgepole_cmd} -E #{ridgepole_env} --config #{ridgepole_config} --file #{ridgepole_schemafile} --apply --dry-run #{options}
      fi
    ]
  end

  desc 'export ridgepole'
  task :export => :environment do
    options ||= ridgepole_options.kind_of?(Array) ? ridgepole_options.join(' ') : ridgepole_options.to_s
    queue! %[
      echo "-----> Export Schema from database."
      if [ -f '#{deploy_to}/#{lock_file}' ]; then
        #{ridgepole_cmd} -E #{ridgepole_env} --config #{ridgepole_config} --export #{options}
      else
        cd #{deploy_to}/#{current_path} && #{ridgepole_cmd} -E #{ridgepole_env} --config #{ridgepole_config} --export #{options}
      fi
    ]
  end
end
