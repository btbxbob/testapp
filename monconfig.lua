static_testapp = { type="dir", base='sites/testapp/', index_file='index.html', default_ctype='' }

handler_testapp = { type="handler", send_spec='tcp://127.0.0.1:10001',
                send_ident='ba06f707-8647-46b9-b7f7-e641d6419909',
                recv_spec='tcp://127.0.0.1:10002', recv_ident=''}

main = {
    bind_addr = "0.0.0.0",
    uuid="505417b8-1de4-454f-98b6-07eb9225cca1",
    access_log="logs/access.log",
    error_log="logs/error.log",
    chroot="./",
    pid_file="run/mongrel2.pid",
    default_host="testapp",
    name="main",
    port=6767,
    hosts= { 
		{   
			name="testapp",
			matching = "xxxxxx", 
			routes={ 
				['/'] = handler_testapp,
                ['/media/'] = static_testapp
			} 
        },
    }
}


settings = {	
	['zeromq.threads'] = 1, 
	['limits.content_length'] = 20971520, 
	['upload.temp_store'] = '/tmp/monserver.upload.XXXXXX' 
}

mimetypes = {}

servers = { main }

