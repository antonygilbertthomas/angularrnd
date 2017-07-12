package angular

class EcsLearnNotes implements Serializable {
    String huid
    Integer fyend
    String note

    static constraints = {
        huid nullable: false
        fyend nullable: false
        note nullable: false
    }

    static mapping = {
        id composite: ['huid','fyend','note']
        version false
    }

}
