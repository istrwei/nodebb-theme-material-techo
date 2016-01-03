<li class="dropdown moderator-tools">
	<a data-toggle="dropdown" aria-expanded="true"><i class="fa fa-fw fa-ellipsis-v"></i></a>
	<ul class="dropdown-menu pull-right">
		<!-- IF posts.display_moderator_tools -->
		<li class="tools-title">[[topic:tools]]</li>
		<li><a component="post/edit" href="#"><i class="fa fa-fw fa-pencil"></i> [[topic:edit]]</a></li>
		<li><a component="post/delete" href="#" class="<!-- IF posts.deleted -->hidden<!-- ENDIF posts.deleted -->"><i class="fa fa-fw fa-trash-o"></i> [[topic:delete]]</a></li>
		<li><a component="post/restore" href="#" class="<!-- IF !posts.deleted -->hidden<!-- ENDIF !posts.deleted -->"><i class="fa fa-fw fa-history"></i> [[topic:restore]]</a></li>
		<li><a component="post/purge" href="#" class="<!-- IF !posts.deleted -->hidden<!-- ENDIF !posts.deleted -->"><i class="fa fa-fw fa-eraser"></i> [[topic:purge]]</a></li>

		<!-- BEGIN posts.tools -->
		<li>
			<a component="{posts.tools.action}" href="#">
				<i class="fa fa-fw {posts.tools.icon}"></i> {{posts.tools.html}}
			</a>
		</li>
		<!-- END posts.tools -->

		<!-- IF posts.display_move_tools -->
		<li><a component="post/move" href="#"><i class="fa fa-fw fa-arrows"></i> [[topic:move]]</a></li>
		<!-- ENDIF posts.display_move_tools -->
		<li class="divider"></li>
		<!-- ENDIF posts.display_moderator_tools -->

		<li>
			<a component="post/favourite" href="#" data-favourited="{posts.favourited}">[[topic:favourite]]
			<span component="post/favourite-count" class="favouriteCount" data-favourites="{posts.reputation}">{posts.reputation}</span>&nbsp;
			<i component="post/favourite/on" class="fa fa-heart <!-- IF !posts.favourited -->hidden<!-- ENDIF !posts.favourited -->"></i>
			<i component="post/favourite/off" class="fa fa-heart-o <!-- IF posts.favourited -->hidden<!-- ENDIF posts.favourited -->"></i>
			</a>
		</li>

		<!-- IF !config.disableSocialButtons -->
		<li class="divider"></li>
		<li class="tools-title">[[topic:share_this_post]]</li>
		<li><a class="weibo-share" href="#"><i class="fa fa-fw fa-weibo"></i> Weibo</a></li>
		<li><a class="weixin-share" href="#"><i class="fa fa-fw fa-weixin"></i> WeiXin</a></li>
		<li><a class="qzone-share" href="#"><i class="fa fa-fw fa-qq"></i> QZone</a></li>
		<!--li><a class="ydnote-share" href="#"><i class="fa fa-fw fa-pencil-square"></i> Youdao Note</a></li-->
		<li><a class="facebook-share" href="#"><i class="fa fa-fw fa-facebook"></i> Facebook</a></li>
		<li><a class="twitter-share" href="#"><i class="fa fa-fw fa-twitter"></i> Twitter</a></li>
		<li><a class="google-share" href="#"><i class="fa fa-fw fa-google-plus"></i> Google+</a></li>
		<!-- ENDIF !config.disableSocialButtons -->

		<li class="divider"></li>

		<!-- IF !posts.selfPost -->
		<li><a component="post/flag" href="#">[[topic:flag_title]]</a></li>
		<!-- ENDIF !posts.selfPost -->
	</ul>
</li>

<script>
	$(document).ready(function(){
		/*
     * Share buttons
     */
    (function () {
        function addHandler(selector, callback) {
            $('#content').off('click', selector).on('click', selector, callback);
        }

        function getPostUrl(clickedElement) {
            var parts = window.location.pathname.split('/');
            var postIndex = parseInt(clickedElement.parents('[data-index]').attr('data-index'), 10);
            return '/' + parts[1] + '/' + parts[2] + (parts[3] ? '/' + parts[3] : '') + (postIndex ? '/' + (postIndex + 1) : '');
        }

        var baseUrl = window.location.protocol + '//' + window.location.host;

		function openJiaThisShare(platform, width, height) {
			window.open('http://www.jiathis.com/send/?webid=' + platform + '&title=' + ajaxify.data.title + '&url=' + encodeURIComponent(baseUrl + getPostUrl($(this))), '_blank', 'width=' + width + ',height=' + height + ',scrollbars=no,status=no');
			return false;
		}

        addHandler('.weibo-share', function () {
			return openJiaThisShare('tsina', 500, 570);
		});

        addHandler('.weixin-share', function () {
			return openJiaThisShare('weixin', 800, 600);
		});

		addHandler('.qzone-share', function () {
			return openJiaThisShare('qzone', 800, 600);
		});

		addHandler('.ydnote-share', function () {
			return openJiaThisShare('ydnote', 800, 600);
		});

		addHandler('.pernament-link', function(){
			$('#content').off('click', '.pernament-link').attr('href', baseUrl + getPostUrl());
		})

    })()
	});

</script>
