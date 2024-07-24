//print(new Date());
//print(new Date().getFullYear());
//print(new Date().getMonth()+1);
//print(new Date().getDate());
//print(new Date().getHours());
//print(new Date().getMinutes());
//print(new Date().getSeconds());

var created=document.properties["cm:created"];

var path=document.displayPath.replace("/Company Home","");

var parent=document.parent;

var hourFolder=companyhome.childByNamePath(path+"/"+created.getHours());
if(hourFolder == null){
	hourFolder=parent.createFolder(created.getHours());
	logger.warn("Folder Created: "+hourFolder.name+" at "+hourFolder.displayPath);
}
var minuteFolder=companyhome.childByNamePath(path+"/"+created.getHours()+"/"+created.getMinutes());
if(minuteFolder == null){
	minuteFolder=hourFolder.createFolder(created.getMinutes());
	logger.warn("Folder Created: "+minuteFolder.name+" at "+minuteFolder.displayPath);
}
var secondFolder=companyhome.childByNamePath(path+"/"+created.getHours()+"/"+created.getMinutes()+"/"+created.getSeconds());
if(secondFolder == null){
	secondFolder=minuteFolder.createFolder(created.getSeconds());
	logger.warn("Folder Created: "+secondFolder.name+" at "+secondFolder.displayPath);
}
document.move(secondFolder);
logger.warn("Document Moved: "+document.name+" to "+secondFolder.displayPath);