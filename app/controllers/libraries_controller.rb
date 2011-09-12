class LibrariesController < ApplicationController
  def index                          
  default_libs = ["A# .NET", "A+", "A++", "Activerecord", "Active_Merchant", "Ada", "Adenine", "Agda", "Agora", "Alice", "AllegroGraph", "Alma-0", "Amazon SimpleDB", "Amiga E", "AMOS", "AMPL", "Apache Cocoon", "APL", "AppleScript", "Appsales", "Aquamacs", "Arc", "ARexx", "Argus", "Asi", "Asi-Http-Request", "AspectJ", "Assembly language", "Ateji PX", "ATS", "Authlogic", "Autocoder", "AutoHotkey", "AutoIt", "Averest", "AWK", "AWStats", "Axum", "Azure Table Storage", "Babbage", "Backbone", "BaseX", "Bash", "BASIC", "Batch (Windows/Dos)", "bc", "BCPL", "BeanShell", "Berkeley DB", "Bertrand", "BETA", "Bigdata", "Bigwig", "Bistro", "BitC", "BLISS", "Blue", "Blueprint-Css", "Bon", "Boo", "BookmarkSync", "Boomerang", "Bootstrap", "Bourne shell (including bash and ksh)", "BPEL", "BREW", "BUGSYS", "Buildbot", "BuildProfessional", "Bup", "C", "Cakephp", "Caml", "Cancan", "Cappuccino", "Cassandra", "Castle", "Cayenne", "Cecil", "Cel", "Cesil", "CFML", "Cg", "CHAIN", "Chapel", "Charity", "Charm", "CHILL", "CHIP-8", "chomski", "Chordless", "Chosen", "ChucK", "CICS", "Cilk", "Citrusleaf ", "CL (IBM)", "Claire", "Clarion", "Clean", "Clicktoflash", "Clipper", "CLIST", "Clojure", "Cloud", "Cloudata", "Cloudera", "CloudKit", "CloverETL", "CLU", "CMS EXEC", "CMS-2", "COBOL - ISO/IEC 1989", "CobolScript", "Cobra", "CODE", "Coffee", "Coffee-Script", "CoffeeScript", "Cola", "ColdC", "ColdFusion", "COMAL", "Combined Programming Language (CPL)", "COMIT", "Common Intermediate Language (CIL)", "Common Lisp (also known as CL)", "Compass", "Component Pascal", "Constraint Handling Rules (CHR)", "Converge", "Cookbooks", "Cool", "Coq", "Coral 66", "Core", "Corn", "CorVision", "CouchDB", "CougarXML", "COWSEL", "CPL", "Crowd", "csh", "Csound", "CSP", "Cucumber", "Cufon", "Curl", "D", "DataFlex", "Datalog", "Datatrieve", "dBase", "DCL", "Deesel", "Delayed_Job", "Deviset", "Diaspora", "Django", "Django-Cms", "Dynomite", "ECMAScript", "Eiffel", "Ejabberd", "Emacs", "Emacs Lisp", "Epigram", "Erlang", "Escapade", "Escher", "Etoys", "Euclid", "Euler", "Euphoria", "eXist", "Express", "F#", "F-Script", "Fabric", "Factor", "Falcon", "Fancy", "Fantom", "Fat_Free_Crm", "Felix", "Ferite", "FFP", "FL", "Flavors", "Flex", "FlockDB", "Formtastic", "Forth", "Fortran - ISO/IEC 1539", "Fortress", "FoxBase", "FoxPro", "FP", "FPr", "Franz Lisp", "Frink", "Fuxi", "G-code", "GameMonkey Script", "GAMS", "GAP", "GDL", "Genie", "GenieDB", "Gibiane", "Git", "Git-Achievements", "Gitflow", "Gitignore", "Gitsharp", "Gitx", "GJ", "GLSL", "GM", "GNU E", "GoLang", "GOAL", "Godiva", "Goo", "Gordon", "GPSS", "GraphTalk", "GRASS", "Greasemonkey", "Green", "Groovy", "Hadoop", "HamsterDB", "Harbour", "Haskell", "HaXe", "HBase", "Hibari", "High Level Assembly", "Hiphop-Php", "HLSL", "Homebrew", "Hop", "Hope", "HPCC", "Html5-Boilerplate", "HyperGraphDB", "Hypertable", "HyperTalk", "Infinite Graph", "InfoGrid", "Inform", "Insoshi", "Ioctocat", "IronPython", "IronRuby", "J#", "J++", "Jackrabbit", "Jade", "Java", "JavaScript", "", "Jekyll", "Jquery", "Jquery-Mobile", "Jquery-Ui", "Jython", "Kaleidoscope", "ksh", "L# .NET", "LabVIEW", "Lasso", "LaTeX", "Legoscript", "Less.Js", "LevelDB", "Liftweb", "LightCloud", "lighttpd", "LilyPond", "Limbo", "Limnor", "LINC", "Lingo", "Linoleum", "Linux", "Linux-2.6", "Lisaac", "Lisp - ISO/IEC 13816", "Lite-C Lite-c", "Logo", "Logtalk", "Lua", "Lucene", "Lucid", "Lustre", "LYaPAS", "Lynx", "Magik", "Magma", "make", "Mangos",  "Maxima", "MDL", "MEMBASE", "Memcached", "MemcacheDB", "Memprof", "Mercury", "Mesa", "Metacard", "Metafont", "MetaL", "Microcode", "MicroScript", "Mnesia", "Moby", "Modernizr", "MongoDB", "Mongoid", "Mootools", "Mortran", "Neo4J", "Net.Data", "NetKernel", "NetLogo", "NewLISP", "Newspeak", "nginx", "Nginx_Http_Push_M", "Node", "Octave", "Oh-My-Zsh", "Omniauth", "OmniMark", "Onyx", "Opal", "OpenEdge ABL", "OpenLink Virtuoso", "OpenNeptune", "OrientDB", "Orwell", "Otp", "Oxygene", "P#", "Paperclip", "Passenger", "Pawn", "Pentaho", "PeopleCode", "Perl", "Perservere", "Phonegap", "Phonegap-Start", "PHP", "Phrogram", "Pico", "Pict", "Pike", "Pinax", "Pincaster", "Pizza", "Postgres", "ProcessingJS", "Prolog", "Prototype", "Pure", "Python", "Qbase", "Qcodo", "Qi", "RabbitMQ", "Racket", "Rails", "Rails_Admin", "Rakudo", "Raphael", "Rapira", "RaptorDB", "Ratfiv", "Ratfor", "RavenDB", "Redcode", "Redis", "Redmine", "Refinerycms", "Reia", "Request", "Resque", "Restfulx_Framework", "Revolution", "Riak", "Ruby", "Ruby_Koans", "Rust", "Rvm", "Scala", "Scalaris", "Scalien", "Scheme", "SciDB", "Scilab", "Scratch", "Script", "Script.NET", "Scriptaculous", "Sed", "Sedna", "Sinatra", "SisoDB", "Smalltalk", "Socket.Io", "Solr", "Sparkle", "Spoon-Knife", "Spree", "Squeak", "Squid", "Squirrel", "STSdb", "Subtext", "Suneido", "SuperCollider", "Symfony", "SyncCharts", "SystemVerilog", "Talend", "Termkit", "Terrastore", "TeX", "Three.Js", "Three20", "ThruDB", "Timber", "Tinymce", "Tokyo Cabinet", "Tokyo Tyrant", "TO4", "ToR", "Tornado", "Trac", "Trinity", "Trinitycore", "Ubercode", "Underscore", "Unicon", "Uniface", "UnrealScript", "UserInfuser", "V8", "Vala", "Varnish", "Verilog", "VertexDB", "Vimrc", "Visor", "Visual C#", "Visual C++", "Visual C++ .Net", "Visual DataFlex", "Visual DialogScript", "Visual FoxPro", "Visual J#", "Visual J++", "Visual Objects", "Visual Prolog", "Voldemort", "Wax", "Web", "Web-App-Theme", "Webpy", "WebQL", "Will_Paginate", "Winbatch", "X++", "X10", "Xapian", "xHarbour", "Yajl", "Yaws", "Yoix", "Yorick", "Yui3", "Zf2", "Zope"]
    @libs = Project.libraries + default_libs
    Rails.logger.info @libs.inspect 
    respond_to do |format|
      format.html            
      format.json { render json: @libs.map {|lib|  
       if (params[:term].present? && lib.downcase.include?(params[:term].downcase))  then        
         {'id'=> lib.downcase, 'label'=> lib, 'value'=> lib}     
         end  
      }.compact.sort_by { |my_item| my_item[:id] }}
    end
  end
end