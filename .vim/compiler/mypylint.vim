setlocal makeprg=pylint\ --output-format=parseable\ --reports=n\ %
setlocal efm=%f:%l:\ [%t]%m,%f:%l:%m
