
    <div class="span8">

        <h1><a href="<?= BASE_URL ?>posts/view/<?= $post['post_id'] ?>"><?=$post['post_subject']?></a></h1>
        <p><?=$post['post_text']?></p>
        <div>
            <span class="badge badge-success"><?=$post['post_created']?></span><div class="pull-right">
                <?foreach ($tags as $tag):?>
                    <a href="tags/view/<?=$tag['tag_id']?>">
                        <span class="label label-info"><?=$tag['tag_name']?></span>
                    </a>
                <?endforeach?>
            </div>
        </div>
    </div>
