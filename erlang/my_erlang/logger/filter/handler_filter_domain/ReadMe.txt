# logger_filters
Filters to use with Logger.
Module logger_filters was introduced in OTP 21.0.
Description
All functions exported from this module can be used as primary or handler filters. See logger:add_primary_filter/2 and logger:add_handler_filter/3 for more information about how filters are added.

Filters are removed with logger:remove_primary_filter/1 and logger:remove_handler_filter/2.

primary 和   handler 的 filters 都可以使用



# add_handler_filter(HandlerId, FilterId, Filter) ->
                      ok | {error, term()}
Types
HandlerId = handler_id()
FilterId = filter_id()
Filter = filter()
Add a filter to the specified handler.

The filter fun is called with the log event as the first parameter, and the specified filter_args() as the second parameter.

The return value of the fun specifies if a log event is to be discarded or forwarded to the handler callback:

log_event()
The filter passed. The next handler filter, if any, is applied. If no more filters exist for this handler, the log event is forwarded to the handler callback.

stop
The filter did not pass, and the log event is immediately discarded.

ignore
The filter has no knowledge of the log event. The next handler filter, if any, is applied. If no more filters exist for this handler, the value of the filter_default configuration parameter for the handler specifies if the log event shall be discarded or forwarded to the handler callback.

See section Filters in the User's Guide for more information about filters.

Some built-in filters exist. These are defined in logger_filters(3).
