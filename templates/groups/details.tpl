<!-- IMPORT partials/breadcrumbs.tpl -->
<div component="groups/container" class="groups details row">
	<div class="col-xs-12">
		<div class="card">
			<div class="card-body" component="groups/cover" style="background-origin: content-box; background-image: url({group.cover:url}); background-position: {group.cover:position};">
				<div class="change">[[groups:cover-change]] <i class="fa fa-fw fa-pencil-square-o"></i></div>
				<div class="save">[[groups:cover-save]] <i class="fa fa-fw fa-floppy-o"></i></div>
				<div class="indicator">[[groups:cover-saving]] <i class="fa fa-fw fa-refresh fa-spin"></i></div>
				<div class="instructions">[[groups:cover-instructions]]</div>

				<!-- IF group.isOwner -->
				<div class="controls">
					<span class="upload"><i class="fa fa-fw fa-2x fa-upload"></i></span>
					<span class="resize"><i class="fa fa-fw fa-2x fa-arrows"></i></span>
					<span class="remove"><i class="fa fa-fw fa-2x fa-times"></i></span>
				</div>
				<div class="save">[[groups:cover-save]] <i class="fa fa-fw fa-floppy-o"></i></div>
				<div class="indicator">[[groups:cover-saving]] <i class="fa fa-fw fa-refresh fa-spin"></i></div>
				<!-- ENDIF group.isOwner -->
			</div>
		</div>
	</div>
	<div class="col-lg-5 col-xs-12">
		<div class="card">
			<div class="card-header ch-alt">
				<i class="fa fa-list-ul"></i> [[groups:details.title]]
				<!-- IF group.private --><span class="label label-info">[[groups:details.private]]</span><!-- ENDIF group.private -->
				<!-- IF group.hidden --><span class="label label-info">[[groups:details.hidden]]</span>&nbsp;<!-- ENDIF group.hidden -->
			</div>
			<div class="card-body card-padding group-details">
				<div><h2>{group.displayName}</h2></div>
				<div><p>{group.descriptionParsed}</p></div>
				<!-- IF isAdmin -->
				<div class="pull-right">
					<a href="{config.relative_path}/admin/manage/groups/{group.nameEncoded}" target="_blank" class="btn btn-info"><i class="fa fa-gear"></i> [[user:edit]]</a>
				</div>
				<!-- ENDIF isAdmin -->
				<!-- IF loggedIn -->
				<div class="pull-right">
					{function.membershipBtn, group}&nbsp;
				</div>
				<!-- ENDIF loggedIn -->
			</div>
		</div>
		<div class="card">
			<div class="card-header ch-alt">
				<i class="fa fa-users"></i> [[groups:details.members]]
			</div>
			<div class="card-body card-padding group-members">
				<div class="fg-line">
				<input class="form-control" type="text" component="groups/members/search" placeholder="[[global:search]]"/>
				</div>
				<table component="groups/members" class="table table-striped table-hover members" data-nextstart="{group.membersNextStart}">
					<!-- BEGIN members -->
					<tr data-uid="{group.members.uid}">
						<td>
							<a href="{config.relative_path}/user/{group.members.userslug}">
								<!-- IF group.members.picture -->
								<img src="{group.members.picture}" />
								<!-- ELSE -->
								<div class="user-icon" style="background-color: {group.members.icon:bgColor};">{group.members.icon:text}</div>
								<!-- ENDIF group.members.picture -->
							</a>
						</td>
						<td class="member-name">
							<a href="{config.relative_path}/user/{group.members.userslug}">{group.members.username}</a> <i title="[[groups:owner]]" class="fa fa-star text-warning <!-- IF !group.members.isOwner -->invisible<!-- ENDIF !group.members.isOwner -->"></i>
						</td>
						<!-- IF group.isOwner -->
						<td>
							<div class="btn-group pull-right">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									[[global:more]] <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li>
										<a href="#" data-ajaxify="false" data-action="toggleOwnership">
											[[groups:details.grant]]
										</a>
									</li>
									<li>
										<a href="#" data-ajaxify="false" data-action="kick">
											[[groups:details.kick]]
										</a>
									</li>
								</ul>
							</div>
						</td>
						<!-- ENDIF group.isOwner -->
					</tr>
					<!-- END members -->
				</table>
			</div>
		</div>
		<!-- IF group.isOwner -->
		<div class="card">
			<div class="card-header ch-alt">
				<i class="fa fa-clock-o"></i> [[groups:details.pending]]
				<!-- IF group.pending.length -->
				<div class="btn-group pull-right">
					<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						[[global:more]] <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#" data-ajaxify="false" data-action="acceptAll">[[groups:pending.accept_all]]</a></li>
						<li><a href="#" data-ajaxify="false" data-action="rejectAll">[[groups:pending.reject_all]]</a></li>
					</ul>
				</div>
				<!-- ENDIF group.pending.length -->
			</div>
			<div class="card-body card-padding">
				<table component="groups/pending" class="table table-striped table-hover pending">
					<!-- IF !group.pending.length -->
					<div class="alert alert-info">[[groups:pending.none]]</div>
					<!-- ENDIF !group.pending.length -->
					
					<!-- BEGIN pending -->
					<tr data-uid="{group.pending.uid}">
						<td>
							<a href="{config.relative_path}/user/{group.pending.userslug}">
								<!-- IF group.pending.picture -->
								<img src="{group.pending.picture}" />
								<!-- ELSE -->
								<div class="user-icon" style="background-color: {group.pending.icon:bgColor};">{group.pending.icon:text}</div>
								<!-- ENDIF group.pending.picture -->
							</a>
						</td>
						<td class="member-name">
							<a href="{config.relative_path}/user/{group.pending.userslug}">{group.pending.username}</a>
						</td>
						<td>
							<div class="btn-group pull-right">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									[[global:more]] <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#" data-ajaxify="false" data-action="accept">[[groups:pending.accept]]</a></li>
									<li><a href="#" data-ajaxify="false" data-action="reject">[[groups:pending.reject]]</a></li>
								</ul>
							</div>
						</td>
					</tr>
					<!-- END pending -->
				</table>
			</div>
		</div>
