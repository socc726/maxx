<rg-modal>

	<div class="overlay { overlay--dismissable: this.opts.modal.dismissable }" if="{ this.opts.modal.isvisible }" onclick="{ close }"></div>
	<div class="modal { modal--ghost: this.opts.modal.ghost }" if="{ this.opts.modal.isvisible }">
		<header class="modal__header">
			<button if="{ this.opts.modal.dismissable }" type="button" class="button button--close" onclick="{ close }">
				&times;
			</button>
			<h3 class="heading heading--small">{ this.opts.modal.heading }</h3>
		</header>

		<div class="modal__body">
			<yield/>
		</div>

		<footer class="modal__footer { 'modal__footer--block': !this.opts.modal.ghost }">
			<button each="{ this.opts.modal.buttons }" type="button" class="button { 'button--' + type }" onclick="{ action }" style="{ style }">
				{ text }
			</button>
		</footer>
	</div>

	<script>

		this.close = () => {
			if (this.opts.modal.dismissable) {
				this.opts.hide()
			}
		}

	</script>

	<style scoped>
		.modal--ghost .modal__footer .button {
			margin: 0 .5em 0 0;
		}

	</style>

</rg-modal>