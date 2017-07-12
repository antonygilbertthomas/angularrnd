package angular

import grails.converters.JSON
import groovy.sql.Sql
import org.grails.web.json.JSONObject

class EcsNotesController {

    def dataSource

    def index() {
        render view: '/ecsNotes/ecsNotes'
    }


    def add() {

        def ecsnotes = params.get('ecsnote')
        def note = new EcsLearnNotes(huid: '01851005', fyend: 2017, note: ecsnotes)
        note.save(flush: true)
        render 'add'

      //  redirect(uri: '/ecsNotes/query')

    }

    def modify() {
        render 'modify'
    }

    def query() {
        def sql = new Sql(dataSource)
        def rows = sql.rows("SELECT * from ecs_learn_notes");
        sql.close()
        render rows as JSON
    }

    def delete() {
        render 'delete'
    }

    def totalBudget() {
        def stdBudget = params.get("stdBudget")
        def travelBudget = params.get("travelBudget")

        def totalBudget = 0;

        if (stdBudget) totalBudget += Float.parseFloat(stdBudget)
        if (travelBudget) totalBudget += Float.parseFloat(travelBudget)

        def returnObj = new  JSONObject().put("totalBudget", totalBudget).toString();
        render returnObj
    }

}
