方式一，使用宏调用
specifying a map as the last parameter to any of the log macros or the logger API functions.
直接用 logger 中的宏，填充Metadata 
?LOG_ERROR(StringOrReport[,Metadata])
?LOG_ERROR(FunOrFormat,Args[,Metadata])


目录： metadata_macro

方式二：set_process_metadata/1 或者update_process_metadata/1.
setting process metadata with set_process_metadata/1 or update_process_metadata/1.

目录: metadata_process



方式三: setting primary metadata with set_primary_config/1 
目录： metadata_primary  

方式四: kernel configuration parameter logger_metadata

metadata_configure  

方式五:  不通过配置文件，通过API设置 logger_formatter

metadata_api
