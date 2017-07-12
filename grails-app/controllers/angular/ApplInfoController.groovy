package angular

import grails.converters.JSON
import grails.transaction.Transactional
import groovy.sql.Sql

class ApplInfoController {

    def dataSource

    def index() {
        render view: '/applInfo/applInfo'
    }

    @Transactional
    def add() {
        def app = new ApplInfo(applicationname: 'Test', logintype: 'TEST', baseurl: 'Test', localauthappname: 'Test')
        app.save()
     //   render 'add'
    }

    def modify() {
        render 'modify'
    }

    def query() {
        def sql = new Sql(dataSource)
        def rows = sql.rows("SELECT * from appl_info where applicationname like'%"
                +params.get('applicationname')+"%'")
        sql.close()
        render rows as JSON
    }

    def delete() {
        render 'delete'
    }

    def updateType() {
        //println (params.get('applicationname'));
        //println (params.get('logintype'));

        def sql = new Sql(dataSource);
        sql.executeUpdate("update appl_info set LOGINTYPE='"+params.get('logintype')+"' where applicationname='"+params.get('applicationname')+"'");
        sql.close();

        //Thread.currentThread().sleep(1000);
        render '';
    }
}
