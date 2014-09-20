<?php
/**
 * Created by PhpStorm.
 * User: Ramon
 * Date: 20.09.2014
 * Time: 22:44
 */

class tags extends Controller{
    function index(){
        $this->tags = get_all("SELECT tag_name, COUNT(post_id) AS count FROM post_tags NATURAL JOIN tag GROUP BY tag_id");
    }
    function view()
    {
        $tag_name = $this->params[0];
        $this->posts = get_all ("SELECT * FROM post_tags NATURAL JOIN tag NATURAL JOIN post
WHERE tag_name = '$tag_name'");
    }
}