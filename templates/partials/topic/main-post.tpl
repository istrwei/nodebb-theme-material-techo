<style>
#browsing-users {
  position: static;
  margin-top: 2px;
}
</style>



  <!-- BEGIN posts -->
  <!-- IF @first -->
  <div component="post" class="<!-- IF posts.deleted -->deleted<!-- ENDIF posts.deleted -->" <!-- IMPORT partials/data/topic.tpl -->>

    <div class="lv-header-alt" component="post/header" itemprop="name">
    <a component="post/anchor" data-index="{posts.index}" name="{posts.index}"></a>
    <meta itemprop="datePublished" content="{posts.relativeTime}">
    <meta itemprop="dateModified" content="{posts.relativeEditTime}">

    <div class="post0-block">
      <div class="post0-content">
        <div class="poster-avatar hidden-xs">
          <a href="{config.relative_path}/user/{posts.user.userslug}">
            <!-- IF posts.user.picture -->
            <img component="user/picture" data-uid="{posts.user.uid}" src="{posts.user.picture}" class="user-picture" title="{posts.user.username}"/>
            <!-- ELSE -->
            <div component="user/picture" data-uid="{posts.user.uid}" class="user-icon" style="background-color: {posts.user.icon:bgColor};">{posts.user.icon:text}</div>
            <!-- ENDIF posts.user.picture -->
          </a>
        </div>
        <div class="post0-title">
          <div class="row">
            <i class="fa fa-thumb-tack <!-- IF !pinned -->hidden<!-- ENDIF !pinned -->"></i> <i class="fa fa-lock <!-- IF !locked -->hidden<!-- ENDIF !locked -->"></i>
            <span class="topic-title" component="topic/title">{title}</span>

            <ul class="lv-actions actions hidden-xs">
              <!-- IMPORT partials/topic/sort.tpl -->
              <li>
                <a component="topic/follow" class="hidden-xs <!-- IF isFollowing -->hidden<!-- ENDIF isFollowing -->">
                  <i class="fa fa-eye-slash"></i>
                </a>

                <a component="topic/unfollow" class="hidden-xs <!-- IF !isFollowing -->hidden<!-- ENDIF !isFollowing -->">
                  <i class="fa fa-eye"></i>
                </a>
              </li>

              <li class="votes">
                <!-- IF !reputation:disabled -->
                <a component="post/upvote" href="#" class="<!-- IF posts.upvoted -->upvoted<!-- ENDIF posts.upvoted -->">
                  <i class="fa fa-thumbs-o-up"></i>
                </a>
                <span component="post/vote-count" data-votes="{posts.votes}">{posts.votes}</span>
                <!-- IF !downvote:disabled -->
                <a component="post/downvote" href="#" class="<!-- IF posts.downvoted -->downvoted<!-- ENDIF posts.downvoted -->">
                  <i class="fa fa-thumbs-o-down"></i>
                </a>
                <!-- ENDIF !downvote:disabled -->
                <!-- ENDIF !reputation:disabled -->
              </li>
              <!-- IMPORT partials/topic/post-menu.tpl -->
            </ul>
          </div>

          <div class="row">
            <div class="post-header">
              <a class="pull-left visible-xs" href="{config.relative_path}/user/{posts.user.userslug}">
                <!-- IF posts.user.picture -->
                <img src="{posts.user.picture}" class="post-user-picture" title="{posts.user.username}"/>
                <!-- ELSE -->
                <div class="user-icon" style="background-color: {posts.user.icon:bgColor};">{posts.user.icon:text}</div>
                <!-- ENDIF posts.user.picture -->

              </a>

              <i component="user/status" class="fa fa-circle status {posts.user.status}" title="[[global:{posts.user.status}]]"></i>
              <strong>
                <a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->" itemprop="author" data-username="{posts.user.username}" data-uid="{posts.user.uid}">{posts.user.username}</a>
              </strong>
              <!-- IMPORT partials/topic/badge.tpl -->
              <span class="post-time">
                [[global:posted_ago, <a class="permalink" href="{config.relative_path}/topic/{slug}/{function.getBookmarkFromIndex}"><span class="timeago" title="{posts.relativeTime}"></span></a>]]

                <span class="post-tools">
                  <a component="post/reply" href="#" class="<!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->"><i class="fa fa-reply"></i>[[topic:reply]]</a>
                  <a component="post/quote" href="#" class="<!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->"><i class="fa fa-quote-left"></i>[[topic:quote]]</a>
                </span>
              </span>
              <ul class="lv-actions actions hidden-xs" id="browsing-users">
                <li>
                  <span class="browsing-users">
                    [[category:browsing]]
                    <div component="topic/browsing/list" class="thread_active_users active-users inline-block"></div>
                  </span>
                  <small class="hidden">
      				<i class="fa fa-users"></i> <span component="topic/browsing/count" class="user-count"></span>
                  </small>
                </li>
              </ul>

            </div>

          </div>
        </div>
        <hr/>
        <div class="post0-body">

          <div component="post/content" itemprop="text">
            <p>{posts.content}</p>
          </div>

          <!-- IF posts.user.signature -->
          <div component="post/signature" data-uid="{posts.user.uid}" class="post-signature hidden-xs">{posts.user.signature}</div>
          <!-- ENDIF posts.user.signature -->

          <small component="post/editor" class="pull-right post-edit <!-- IF !posts.editor.username -->hidden<!-- ENDIF !posts.editor.username -->">[[global:last_edited_by_ago, <strong><a href="{config.relative_path}/user/{posts.editor.userslug}">{posts.editor.username}</a></strong>, <span class="timeago" title="{posts.relativeEditTime}"></span>]]</small>
        </div>

      </div>
    </div>
  </div>

  </div>

  <!-- ENDIF @first -->
  <!-- END posts -->
