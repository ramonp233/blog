<div class="span8">
    <?foreach( $posts as $post ):?>
    <a href="<?=BASE_URL?>posts/view/<?=$post['post_id']?>"><?=$post['post_subject']?></a>
    <p><?=$post['post_text']?></p>
    <div>
        <span class="badge badge-success">Posted <?=$post['post_created']?></span><div class="pull-right"><span class="label">alice</span> <span class="label">story</span> <span class="label">blog</span> <span class="label">personal</span></div>
    </div>
    <hr>
    <?endforeach?>
</div>