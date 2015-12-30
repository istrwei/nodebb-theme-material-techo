<div class="lv-body" component="category" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}">
	<meta itemprop="itemListOrder" content="descending">
	<!-- BEGIN topics -->
	<div component="category/topic" class="lv-item row clearfix {function.generateTopicClass}" <!-- IMPORT partials/data/category.tpl -->>
		<meta itemprop="name" content="{function.stripTags, title}">
		<!-- IF showSelect -->
        <div class="checkbox pull-left">
            <label>
                <input type="checkbox" class="select">
                <i class="input-helper"></i>
            </label>
        </div>
        <!-- ENDIF showSelect -->

		<div class="lv-item-avatar hidden-xs">
        	<a href="{config.relative_path}/user/{topics.user.userslug}">

							<!-- IF topics.user.picture -->
								<img src="{topics.user.picture}" class="lv-img" title="{topics.user.username}"/>
							<!-- ELSE -->
								<div class="user-icon" style="background-color: {topics.user.icon:bgColor};">{topics.user.icon:text}</div>
							<!-- ENDIF topics.user.picture -->

        	</a>
    	</div>
		
		
		<div class="lv-item-right hidden-xs">
            <ul>
            <!-- IF topics.unreplied -->
			<li class="lv-small">[[category:no_replies]]</li>
			<!-- ELSE -->
			<!-- IF topics.teaser.index -->
			<li class="lv-small">
				<a href="<!-- IF topics.teaser.user.userslug -->{config.relative_path}/user/{topics.teaser.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.teaser.user.userslug -->">

					<!-- IF topics.teaser.user.picture -->
					<img title="{topics.teaser.user.username}" class="user-picture" src="{topics.teaser.user.picture}" />
					<!-- ELSE -->
					<span title="{topics.teaser.user.username}" class="user-icon" style="background-color: {topics.teaser.user.icon:bgColor};">{topics.teaser.user.icon:text}</span>
					<!-- ENDIF topics.teaser.user.picture -->

				</a>
				<a href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
					[[global:replied_ago, <span class="timeago" title="{topics.teaser.timestamp}"></span>]]
				</a>
			</li>
			<!-- ENDIF topics.teaser.index -->
			<!-- IF !topics.teaser.index -->
			<li class="lv-small">[[category:no_replies]]</li>
			<!-- ENDIF !topics.teaser.index -->
			<!-- ENDIF topics.unreplied -->
            </ul>
        </div>
			
		<div class="lv-item-right visible-xs-block">
            <ul>
			<li class="lv-small"><span class="human-readable-number badge" title="{topics.postcount}"></span></li>
            </ul>
        </div>
		
    	<div class="lv-item-body">
    		<div class="lv-title" component="topic/header">
    			<strong><i component="topic/pinned" class="fa fa-thumb-tack <!-- IF !topics.pinned -->hide<!-- ENDIF !topics.pinned -->"></i>
				<i component="topic/locked" class="fa fa-lock <!-- IF !topics.locked -->hide<!-- ENDIF !topics.locked -->"></i></strong>
				<!-- IF !topics.noAnchor -->
				<a href="{config.relative_path}/topic/{topics.slug}"><span class="topic-title">{topics.title}</span>
				</a>
				<!-- ELSE -->
				<span class="topic-title">{topics.title}</span>
				<!-- ENDIF !topics.noAnchor -->
			</div>

			<!-- IF template.category -->
			<small>
            	[[global:posts]] <span class="human-readable-number" title="{topics.postcount}"></span> | [[global:views]] <span class="human-readable-number" title="{topics.viewcount}"></span> |
            	<!-- IF topics.user.userslug -->
				[[global:posted_ago_by, <span class="timeago" title="{topics.relativeTime}"></span>, <strong>{topics.user.username}</strong>]]
				<!-- ELSE -->
				[[global:posted_ago_by_guest, <span class="timeago" title="{topics.relativeTime}"></span>]]
				<!-- ENDIF topics.user.userslug -->
			</small>
			<!-- ENDIF template.category -->

			<!-- IF !template.category -->
			<small class="lv-small">
				<span class="hidden-xs">[[global:posts]] <span class="human-readable-number" title="{topics.postcount}"></span> | [[global:views]] <span class="human-readable-number" title="{topics.viewcount}"></span> | </span>
				<!-- IF topics.user.userslug -->
				[[global:posted_in_ago_by, <a href="{config.relative_path}/category/{topics.category.slug}"><i class="fa {topics.category.icon}"></i> {topics.category.name}</a>, <span class="timeago" title="{topics.relativeTime}"></span>, <strong>{topics.user.username}</strong>]]
				<!-- ELSE -->
				[[global:posted_in_ago_by_guest, <a href="{config.relative_path}/category/{topics.category.slug}"><i class="fa {topics.category.icon}"></i> {topics.category.name}</a>, <span class="timeago" title="{topics.relativeTime}"></span>]]
				<!-- ENDIF topics.user.userslug -->
			</small>
			<!-- ENDIF !template.category -->

			<ul class="lv-attrs hidden-xs">
                <!-- IF topics.tags.length -->
				<!-- BEGIN tags -->
				<div class="pull-left tag-container">
					<a href="{config.relative_path}/tags/{topics.tags.value}">
					<span class="tag-item" data-tag="{topics.tags.value}" style="<!-- IF topics.tags.color -->color: {topics.tags.color};<!-- ENDIF topics.tags.color --><!-- IF topics.tags.bgColor -->background-color: {topics.tags.bgColor};<!-- ENDIF topics.tags.bgColor -->">{topics.tags.value}</span><span class="tag-topic-count human-readable-number" title="{topics.tags.score}">{topics.tags.score}</span></a>
				</div>
				<!-- END tags -->
				<!-- ENDIF topics.tags.length -->
            </ul>
		</div>
	</div>
	<!-- END topics -->
</div>
