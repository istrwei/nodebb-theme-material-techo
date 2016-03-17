<div class="topic">
	<!-- IMPORT partials/breadcrumbs.tpl -->
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="listview lv-lg">

					<div class="lv-body" component="topic" data-tid="{tid}">
                        
						    <!-- BEGIN posts -->
							<!-- IF !posts.index -->
								<!-- IMPORT partials/topic/main-post.tpl -->
							<!-- ENDIF !posts.index -->
							<!-- IF posts.index -->
								<!-- IMPORT partials/topic/post.tpl -->
							<!-- ENDIF posts.index -->
							<!-- END posts -->

						<div class="post-bar">
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
</div>
<!-- IF !config.usePagination -->
	<noscript>
	<!-- IMPORT partials/paginator.tpl -->
	</noscript>
<!-- ENDIF !config.usePagination -->