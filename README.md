Aria2 with webui
---
Only 58Mb.  
Edit config file out of the image.  
Move file completed to another folder.  
(Tasks that contains more than one files will not be moved.)  

### Install
I. replace **/DOWNLOAD_DIR** and **/CONFIG_DIR** for save data, and **YOUR_SECRET_CODE** for security. Run command below  
```
#!/bin/bash
	docker run -d \
	--name aria2 \
	-p 6800:6800 \
	-p 6880:80 \
	-e VIRTUAL_HOST=***\
	-e SECRET=*** \
	-e USER=*** \
	-e PASSWORD=*** \
	-v /share/download/complete:/data \
	-v `pwd`/data:/conf \
	ricou08/docker-aria2
```
  
II. Open `http://serverip:6880/` for aria2-webui, open `http://serverip:6888/` to browse data folder.  

