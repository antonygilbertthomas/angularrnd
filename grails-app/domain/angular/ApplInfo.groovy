package angular

class ApplInfo {

    String applicationname
    String logintype
    String baseurl
    String localauthappname

    static constraints = {
        applicationname nullable: false
        logintype nullable: false
        baseurl nullable: false
        localauthappname nullable: false
    }

    static mapping = {
        id name: 'applicationname'
        version false
    }
}
