variable "scaleway_config" {
    type = object({
        project_id = string
        zone = string
        region = string
        type = string
        image = string
    })
    default = {
        project_id = "PROJECT_ID"
        zone = "pl-waw-2"
        region = "pl-waw"
        type = "STARDUST1-S"
        image = "rockylinux_9"   
    }                                                                
}