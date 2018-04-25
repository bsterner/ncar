require 'irb/completion'

IRB.conf[:AUTO_INDENT] = true
require 'irb/completion'

# By default, irb disables history and will not store any commands you used.
# If you want to enable history, add the following to your .irbrc:
IRB.conf[:SAVE_HISTORY] = 1000

class Object
  # Show methods unique to this object
  # +others+ can be like Enumerable, etc.
  def uniq_methods(*others)
    hide_methods = ([Object] + others).flat_map(&:instance_methods)
    (self.methods - hide_methods).sort
  end
end

def to_fixture_yaml(models, key = :to_s)
  keys = models.map { |model| model.send(key).downcase.gsub /[^a-z]+/, '_' }
  # This only works in Rails 4
  pk = models.primary_key rescue models.first.class.primary_key
  values = models.map { |model| model.serializable_hash.except pk }

  Hash[keys.zip values].to_yaml
end

if defined?(Rails)
  def vx
    app.controller.try(:view_context)
  end

  if defined?(XrasSubmitGui)
    if Person.instance_method(:initialize).arity == 0
      def auth(username = 'speckins')
        [Rails.configuration.allocations_process, Rails.configuration.submit_api_key, Person.new.tap { |p| p.username = username }]
      end
    else
      def auth(username = 'speckins')
        [Rails.configuration.allocations_process, Rails.configuration.submit_api_key, Person.new('username' => username)]
      end
    end
  end
end
