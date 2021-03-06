module Awestruct
  class ExceptionHelper
    def self.log_message message
      $LOG.error message if $LOG.error
    end

    def self.log_error exception
      $LOG.error "An error occurred: #{exception.message}" if $LOG.error
    end

    def self.log_backtrace exception
      $LOG.error "#{exception.backtrace.join("\n")}" if $LOG.error
    end
    
    def self.log_building_error exception, relative_source_path
      $LOG.error "While processing file #{relative_source_path}"
      self.log_error exception
      self.log_backtrace exception
    end

    def self.html_error_report exception, relative_source_path
"<h1>#{exception.message}</h1>
<h2>Rendering file #{relative_source_path} resulted in a failure.</h2>
<p>Line: #{(exception.respond_to? :line) ? exception.line : 'unknown'}</p>
<p>Backtrace:</p>
<pre>#{exception.backtrace.join "\n"}</pre>"
   end
  end
end
