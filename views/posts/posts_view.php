
    <div class="span8">

        <h1><a href="<?= BASE_URL ?>posts/view/<?= $post['post_id'] ?>"><?=$post['post_subject']?></a></h1>
        <p><?=$post['post_text']?></p>
        <div>
            <span class="badge badge-success"><?=$post['post_created']?></span><div class="pull-right">
                <?foreach ($tags as $tag):?>
                    <a href="tags/view/<?=$tag['tag_name']?>">
                        <span class="label label-info"><?=$tag['tag_name']?></span>
                    </a>
                <?endforeach?>
            </div>
        </div>
        <div class="actionBox">
            <ul class="commentList">
                <?foreach ($comments as $comment):?>
                    <li style="list-style-type: none; margin: 10px 0; padding: 10px 0; border-bottom: 1px solid gray;">
                        <div class="commentText">
                            <p style="font-size: 14px;color:red;"><?=$comment['comment_author']?></p>
                            <p style="font-size: 12px; "><?=$comment['comment_text']?></p>
                            <span style="color: blue;" class="date sub-text">on <?=$comment['comment_created']?></span>
                        </div>
                    </li>
                <?endforeach?>
            </ul>
            <form class="form-inline" role="form" method="post">
                <div class="form-group">
                    <input class="form-control" type="text" name="data[comment_text]" placeholder="Your comments" />
                </div>
                <div class="form-group">
                    <button class="btn btn-default">Add</button>
                </div>
            </form>
        </div>
    </div>
