var parent=document.getParent();
var count=parent.childFileFolders(true,true).length;
if(count>5){
	var subFolderName="SubFolder";
	var path=document.displayPath+"/"+subFolderName;
	//print(path);
	var subFolder = companyhome.childByNamePath(path.replace("/Company Home", ""));
	//print(subFolder);
	if(subFolder == null){
		subFolder=parent.createFolder("SubFolder","cm:folder");
	}
	//what if subfolder has file with same name?
	document.move(subFolder);
}