<div class="topic">
	<!-- IMPORT partials/breadcrumbs.tpl -->
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="listview lv-lg">

					<div class="lv-body" component="topic" data-tid="{tid}">
						<!-- IMPORT partials/topic/main-post.tpl -->

							<!-- BEGIN posts -->
							<!-- IF !@first -->
								<!-- IMPORT partials/topic/post.tpl -->
							<!-- ENDIF !@first -->
							<!-- END posts -->

							<div class="post-bar <!-- IF unreplied -->hidden<!-- ENDIF unreplied -->">
								<!-- IMPORT partials/post_bar.tpl -->
							</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- IF config.usePagination -->
		<!-- IMPORT partials/paginator.tpl -->
	<!-- ENDIF config.usePagination -->

	<!-- IMPORT partials/move_thread_modal.tpl -->
	<!-- IMPORT partials/fork_thread_modal.tpl -->
	<!-- IMPORT partials/move_post_modal.tpl -->
</div>
<!-- IMPORT partials/noscript/paginator.tpl -->
