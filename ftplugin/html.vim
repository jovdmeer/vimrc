" Vim script file                                           vim600:fdm=marker:
" FileType:	HTML
" Maintainer:	Devin Weaver <vim@tritarget.com>
" Last Change: Tue Aug 12 2008 15:40:24 CEST
" Version:      $Revision: 1.2 $
" Location:	http://tritarget.com/pub/vim/ftplugin/html.vim

" This is a wrapper script to add extra html support to xml documents.

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
" Don't set 'b:did_ftplugin = 1' because that is xml.vim's responsability.

if !exists("*HtmlAttribCallback")
function HtmlAttribCallback( xml_tag )
    if a:xml_tag ==? "table"
	return "cellpadding=\"0\" cellspacing=\"0\" border=\"0\""
    elseif a:xml_tag ==? "link"
	return "href=\"/site.css\" rel=\"stylesheet\" type=\"text/css\""
"    elseif a:xml_tag ==? "body"
"  return "bgcolor=\"white\""
    elseif a:xml_tag ==? "frame"
	return "name=\"NAME\" src=\"/\" scrolling=\"auto\" noresize"
    elseif a:xml_tag ==? "frameset"
	return "rows=\"0,*\" cols=\"*,0\" border=\"0\""
    else
	return 0
    endif
endfunction
endif

let b:match_words = '<\<\([^/]\w*\)\>[^>]*>:</\<\1\>[^>]*>'

" On to loading xml.vim
runtime ftplugin/xml.vim

