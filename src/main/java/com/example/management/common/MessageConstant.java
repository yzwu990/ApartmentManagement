package com.example.management.common;

/**
 * @Auth: yz
 * @Desc: return message
 */
public class MessageConstant {
    //---------------------------Community Operation Message Prompt Information---------------------------------------
    public static final String COMMUNITY_SEARCH_SUCCESS="Community list information queried successfully!";
    public static final String COMMUNITY_ADD_SUCCESS="Community information added successfully!";
    public static final String COMMUNITY_UPDATE_SUCCESS="Community information updated successfully!";
    public static final String COMMUNITY_DELETE_SUCCESS="Community information deleted successfully!";
    public static final String COMMUNITY_PIC_UPLOAD_SUCCESS="Community thumbnail uploaded successfully!";
    public static final String COMMUNITY_PIC_DEL_SUCCESS = "Community thumbnail deleted successfully!";
    public static final String COMMUNITY_FIND_BY_ID_SUCCESS = "Get community object by primary key successfully!";
    public static final String COMMUNITY_UPDATE_STATUS_SUCCESS = "Community status information updated successfully!";
    //---------------------------Building (Community) Operation Message Prompt Information---------------------------------------
//---------------------------System Prompt Information----------------------------------------------------------
    public static final String SYSTEM_BUSY = "The system is busy, please try again later!";
    //---------------------------File Upload Prompt Information-------------------------------------------------------
    public static final String NO_FILE_SELECTED = "No file selected for upload, please select and upload!";
    public static final String NO_WRITE_PERMISSION = "Upload directory has no write permission!";
    public static final String INCORRECT_DIRECTORY_NAME = "Incorrect directory name!";
    public static final String SIZE_EXCEEDS__LIMIT = "Upload file size exceeds limit!";
    public static final String FILE_TYPE_ERROR = "File type error, only JPG/PNG/JPEG/GIF and other image types of files are allowed for upload!";
}
