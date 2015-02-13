{include file="header.tpl"}
<div class="row">
	<div class="col-lg-12">
		<ol class="breadcrumb">
			<li><a href="index.php?page=DomainList"><i class="fa fa-home"></i> Domain Control Panel</a></li>
			<li class="active"><a href="index.php?page=RecordList&id={$soa['id']}">{$soa['origin']}</a></li>
		</ol>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="page-header pull-right">
			<a href="index.php?page=DomainList" class="btn btn-gr-gray"><i class="fa fa-list"></i> Domains auflisten</a>
			<a href="index.php?page=RecordAdd&id={$soa['id']}" class="btn btn-gr-gray"><i class="fa fa-plus"></i> Eintrag hinzufügen</a>
			<a href="#" id="export" export-id="{$soa['id']}" class="btn btn-gr-gray"><i class="fa fa-download"></i> Exportieren</a>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Records <span class="badge badge-black">{$records|count}</span></div>
			<div class="panel-body">
				<div class="dataTable_wrapper">
					<table class="table table-bordered table-hover radius table-striped dataTable" data-dontsort="6" data-sort="asc,3">
						<thead>
							<tr>
								<th>ID</th>
								<th>Host</th>
								<th>TTL</th>
								<th>Type</th>
								<th>Prio</th>
								<th>Data</th>
								<th>Manage</th>
							</tr>
						</thead>

						<tbody>
							{foreach from=$records item=record}
							<tr>
								<td>{$record['id']}</td>
								<td>{if $record['active'] != 1}<span class="badge badge-red">{lang}domain.disabled{/lang}</span> {/if}<span title="{if $record['name']|strpos:$soa['origin'] === false}{$record['name']}.{$soa['origin']}{else}{$record['name']}{/if}" class="ttips">{$record['name']}</span></td>
								<td>{$record['ttl']}</td>
								<td>{$record['type']}</td>
								<td>{$record['aux']}</td>
								<td>{if $record['data']|strlen > 40}{$record['data']|substr:0:40}&hellip;{else}{$record['data']}{/if}</td>
								<td>
									<span class="fa fa-remove ttips pointer deleteRecord" delete-id="{$record['id']}" delete-confirm="{lang}record.delete.message{/lang}" title="{lang}button.delete{/lang}"></span>
									<span class="fa fa{if $record['active']}-check{/if}-square-o ttips pointer toggleRecord" toggle-id="{$record['id']}" title="{if $record['active']}{lang}button.disable{/lang}{else}{lang}button.enable{/lang}{/if}" data-disable-message="{lang}button.disable{/lang}" data-enable-message="{lang}button.enable{/lang}"></span>
									<a href="index.php?page=RecordEdit&id={$record['id']}"><span class="fa fa-pencil ttips pointer" title="Edit"></span></a>
								</td>
							</tr>
							{/foreach}
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
{include file="footer.tpl"}